# frozen_string_literal: true
require 'date'

class Rental
  attr_accessor :id, :car_id, :start_date, :end_date, :distance
  def initialize (id:, car_id:, start_date:, end_date:, distance:)
    @id = id
    @car_id = car_id
    @start_date = start_date
    @end_date = end_date
    @distance = distance

    validate_inputs_rental
  end

  def day_fee
    100 * ((convert_to_date(end_date) - convert_to_date(start_date)).to_i + 1)
  end

  def prices_primes
    if nb_days < 2
      nb_days
    elsif nb_days > 1 && nb_days < 4
      nb_days + (nb_days -  1) * 0.9
    elsif nb_days < 11 && nb_days > 4
      nb_days * (1 + 0.9 * 3) + (nb_days - 4) * 0.7
    elsif nb_days > 10
      nb_days * (1 + 0.9 * 3 + 0.7 * 7) +(nb_days - 10) * 0.5
    end
  end

  def nb_days
    ((convert_to_date(end_date) - convert_to_date(start_date)).to_i + 1)
  end

  private
  def validate_inputs_rental
    raise ArgumentError, 'id shall be an integer' unless id.is_a? Integer
    raise ArgumentError, 'car_id shall be an integer' unless car_id.is_a? Integer
    raise ArgumentError, 'start_date shall be a string' unless start_date.is_a? String
    raise ArgumentError, 'end_date shall be a string' unless end_date.is_a? String
    raise ArgumentError, 'distance shall be an integer' unless distance.is_a? Integer
  end

  def convert_to_date(string)
    Date.strptime(string, "%Y-%m-%d")
  end
end
