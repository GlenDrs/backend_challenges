# frozen_string_literal: true
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

=begin
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
      result.push((price_from_cars(rental['car_id'])).merge(rental))
    end
    result
  end
=end
  def test
    data['rentals'].each do |rent|
      p price_from_cars(rent['car_id'])
    end
  end

  private
  def cars_data
    data['cars'].each do |car|
      cars.push(car_call(car))
    end
  end

  def rentals_data
    data['rentals'].each do |rental|
      rentals.push(rental_call(rental))
    end
  end

  def car_call(data)
    ::Car.new(
      id: data[:id],
      price_per_day: data[:price_per_day],
      price_per_km: data[:price_per_km]
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

  def price_from_cars(id)
    detected_car = cars.detect{|car| car.id == id }
    detected_car
  end

  def price_from_rentals(car_id)
    detected_rental = rentals.detect {|rental| rental.car_id == car_id }
    detected_rental
  end

  def nb_days(start_date, end_date)
    (date_from_string(end_date) - date_from_string(start_date) +1 ).to_i
  end

  def date_from_string(string_date)
    Date.strptime(string_date, '%Y-%m-%d')
  end
end
