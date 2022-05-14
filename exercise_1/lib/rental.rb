require 'read'
require 'date'

attr_reader :id, :car_id, :start_date, :end_date, :distance

  def initialize(id, car_id, start_date, end_date, distance)
    @id = id
    @car_id = car_id
    @start_date = start_date
    @end_date = end_date

    validate_inputs_rental
  end

  def nb_days
    (date_from_string(end_date) - date_from_string(end_date)).to_i + 1
  end


  private
  def validate_inputs_rental
    raise ArgumentError, 'id shall be an integer' unless id.is_a? Integer
    raise ArgumentError, 'car_id shall be an integer' unless car_id.is_a? Integer
    raise ArgumentError, 'start_date shall be an integer' unless car_id.is_a? String
    raise ArgumentError, 'end_date shall be an integer' unless car_id.is_a? String
    raise ArgumentError, 'distance shall be an integer' unless price_per_km.is_a? Integer
  end

  def date_from_string(string_date)
    DateTime.strptime(string_date, '%Y-%m-%d')
  end

end
