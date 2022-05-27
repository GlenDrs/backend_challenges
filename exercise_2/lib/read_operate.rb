# frozen_string_literal: true
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

  def prices_with_discount
    result = []
    rentals.each do |rental|
      car_var = detect_car(rental.car_id)
      price_discount = car_var.price_per_km * rental.distance + rental.day_discounts * car_var.price_per_day
      result.push(id: rental.id, price: price_discount.round)
    end
    {rentals: result}
  end

  private
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

end
