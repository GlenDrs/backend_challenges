# frozen_string_literal: true
require 'json'
require 'date'
require_relative 'car'
require_relative 'rental'

class ReadOperate
  attr_accessor :cars, :rentals
  attr_reader :data
  def initialize(data)
    @data = data
    @cars = []
    @rentals = []

    cars_data
    rentals_data
    
  end

  def test
    adjusted_prices
  end

  private
  def adjusted_prices
    fixed_price = new_car_data.first.price_per_day
    km_price = new_car_data.first.price_per_km
    new_rental.each do |rental|
      if rental.nb_days == 1
        p fixed_price + km_price * rental.distance
      elsif rental.nb_days < 4 && rental.nb_days > 1
        a = (fixed_price * 0.9 * (rental.nb_days - 1) + fixed_price).round
        p a + km_price * rental.distance
      elsif rental.nb_days < 11 && rental.nb_days > 4
        b = (fixed_price * (1 + 0.9 * 3) + fixed_price * 0.7 * (rental.nb_days - 4)).round
        p b + km_price * rental.distance
      elsif rental.nb_days > 10
        c = (fixed_price * (1 + 0.9 * 3 + 0.7 * 6 + ((rental.nb_days - 10)* 0.5))).round
        p c + km_price * rental.distance
      end
    end
  end

  def new_car_data
    cars.each do |car|
      detect_rental(car.id)
    end.flatten
  end

  def new_rental
    rentals.each do |rental|
      detect_car(rental.car_id)
    end.flatten    
  end

  def rentals_data
    data['rentals'].each do |rental|
      rentals.push(call_rentals(rental))
    end
  end

  def cars_data
    data['cars'].each do |car|
      cars.push(call_cars(car))     
    end
  end

  def call_cars(data)
    ::Car.new(
      id: data['id'],
      price_per_day: data['price_per_day'],
      price_per_km: data['price_per_km']
    )
  end

  def call_rentals(data)
    ::Rental.new(
      id: data['id'],
      car_id: data['car_id'],
      start_date: data['start_date'],
      end_date: data['end_date'],
      distance: data['distance']
    )
  end

  def detect_car(car_id)
    dtected_cars = cars.detect {|car| car.id == car_id}
    dtected_cars
  end

  def detect_rental(id)
    detected_rentals = rentals.detect {|rental| rental.id == id}
    detected_rentals
  end

  def promo_price
    x = cars2.first['price_per_day']
    (0..(rentals2.length - 1)).map do |i|
      if count_days(i) < 4
        (x * (0.9 * i) + x).to_i
      elsif count_days(i) > 10
        (x * (1 + 0.9 * 3 + 0.7 * 6 + ((count_days(i) - 10)* 0.5))).round
      end
    end
  end



  def read_json_2(data)
    #JSON.parse(File.read '../data/input.json')
    JSON.parse(File.read data)
  end
end
