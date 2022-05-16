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

    #create_cars
    #create_rentals
  end

  def show_cars
    p create_rentals
  end

  private

  def create_cars
    data['cars'].each do |car|
      cars << car_call(car)
    end
  end

  def create_rentals
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

  def data
    Read.new.read_json
  end

=begin
  def compute_array
    compt_array = []
    (0..(cars.length - 1)).each do |i|
      compt_array <<
      [
        cars[i]['price_per_day'],
        nb_days(i),
        cars[i]['price_per_km'],
        rentals[i]['distance'],
        rentals[i]['id']
      ]
    end
    compt_array
  end

  private

  def nb_days(index)
    (end_date(index) - start_date(index) + 1).to_i
  end

  def end_date(index)
    start_date = Date.strptime(rentals[index]['end_date'], '%Y-%m-%d')
  end

  def start_date(index)
    end_date = Date.strptime(rentals[index]['start_date'], '%Y-%m-%d')
  end

  def cars
    call_data['cars']
  end

  def rentals
    call_data['rentals']
  end

  def call_data
    Read.new.read_json
  end
=end
end
