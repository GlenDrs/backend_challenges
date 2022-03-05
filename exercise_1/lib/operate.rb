# frozen_string_literal: true
require 'date'
require_relative 'read'

class Operate
  def compute_array
    compt_array = []
    (0..(cars.length - 1)).map do |index|
      compt_array <<
      [
        cars[index]['price_per_day'],
        nb_days(index),
        cars[index]['price_per_km'],
        rentals[index]['distance'],
        rentals[index]['id']
      ]
    end
    compt_array
  end

  private

  def nb_days(index)
    (end_date(index) - start_date(index) + 1).to_i
  end

  def start_date(index)
    end_date = Date.strptime(rentals[index]['start_date'], '%Y-%m-%d')
  end

  def end_date(index)
    start_date = Date.strptime(rentals[index]['end_date'], '%Y-%m-%d')
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
end
