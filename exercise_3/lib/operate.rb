# frozen_string_literal: true
require_relative 'car'
require_relative 'rental'

class Operate
  attr_accessor :cars, :rentals
  attr_reader :data
  def initialize (data)
    @data = data
    @cars = []
    @rentals = []

    cars_data
    rentals_data
  end

  def price_and_fees
    result = []
    rentals.each do |rental|
      car_var = detect_cars(rental.car_id)
      price_tot = car_var.price_per_km * rental.distance + rental.prices_primes * (car_var.price_per_day * 200)
      result.push(id: rental.id, price: price_tot.round, commission: {
        insurance_fee: (price_tot * 0.15).round,
        assistance_fee: rental.day_fee,
        drivy_fee: (price_tot * 0.15).round - rental.day_fee 
      })
    end
    {rentals: result}
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
      id: data['id'],
      price_per_day: data['price_per_day'],
      price_per_km: data['price_per_km']
    )
  end

  def rental_call(data)
    ::Rental.new(
      id: data['id'],
      car_id: data['car_id'],
      start_date: data['start_date'],
      end_date: data['end_date'],
      distance: data['distance']
    )
  end

  def detect_cars(id)
    detected_car = cars.detect{|car| car.id == id }
    detected_car
  end

  def detect_rentals(car_id)
    detected_rental = rentals.detect {|rental| rental.car_id == car_id }
    detected_rental
  end

end
