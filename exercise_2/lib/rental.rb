# frozen_string_literal: true
require 'date'

class Rental
  attr_reader :id, :car_id, :start_date, :end_date, :distance
  def initialize(id:, car_id:, start_date:, end_date:, distance:)
    @id = id
    @car_id = car_id
    @start_date = start_date
    @end_date = end_date
    @distance = distance
  end

  def nb_days
    (convert_to_date(end_date) - convert_to_date(start_date) + 1).to_i
  end

  private
  def convert_to_date(string_date)
    Date.strptime(string_date, "%Y-%m-%d")
  end

end
