# frozen_string_literal: true
require 'date'
require_relative 'read'
require_relative 'car'
require_relative 'rental'

class Operate
  attr_accessor :cars, :rentals
  attr_reader :data 

  def initialize(data)
    @data = data
    @cars = []
    @rentals = []

    cars_data
    rentals_data
  end

  def prices
    price_total = []
    combined_data.each do |combined|
      fix_price_day = combined['price_per_day'] * nb_days(combined['start_date'], combined['end_date'])
      price_per_km = combined['price_per_km'] * combined['distance']
      price_total << {id: combined['id'], price: price_per_km + fix_price_day }
    end
    {rentals: price_total}
  end

  private
  def combined_data
    result = []
    rentals_data.each do |rental|
      #result.push(rental.merge(price_from_cars(rental['car_id'])))
      result.push((price_from_cars(rental['car_id'])).merge(rental))
    end
    result
  end

  def price_from_cars(id)
    cars_data.detect {|car| car['id'] == id }
  end

  def price_from_rentals(car_id)
    rentals_data.detect {|rental| rental['car_id'] == car_id }
  end

  def cars_data
    data['cars'].each do |car|
      cars << car_call(car)
    end
  end

  def rentals_data
    data['rentals'].each do |rental|
      rentals << rental_call(rental)
    end
  end

  def car_call(input)
    ::Car.new(
      id: input[:id],
      price_per_day: input[:price_per_day],
      price_per_km: input[:price_per_km]
    )
  end

  def rental_call(data)
    ::Rental.new(
      id: data[:id],
      car_id: data[:car_id],
      start_date: data[:start_date],
      end_date: data[:end_date],
      distance: data[:distance]
    )
  end

  def nb_days(start_date, end_date)
    (date_from_string(end_date) - date_from_string(start_date) +1 ).to_i
  end

  def date_from_string(string_date)
    Date.strptime(string_date, '%Y-%m-%d')
  end
end
