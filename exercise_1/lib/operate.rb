# frozen_string_literal: true
require 'date'
require_relative 'read'

class Operate
  def call_data
    Read.new.read_json
  end

  def compute_array
    compt_array = []
    (0..(cars.length - 1)).map do |index|
      compt_array <<
      [
        cars[index]["price_per_day"],
        (Date.strptime(rentals[index]["end_date"], '%Y-%m-%d')- Date.strptime(rentals[index]["start_date"], '%Y-%m-%d')+ 1).to_i,
        cars[index]["price_per_km"],
        rentals[index]["distance"]
      ]
    end
    compt_array
  end

  private

  def cars
    Operate.new.call_data["cars"]
  end

  def rentals
    Operate.new.call_data["rentals"]
  end

end
