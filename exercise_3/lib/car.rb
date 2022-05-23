# frozen_string_literal: true

class Car
  attr_accessor :id, :price_per_day, :price_per_km
  def initialize(id:, price_per_day:, price_per_km:)
    @id = id
    @price_per_day = price_per_km
    @price_per_km = price_per_km

    validate_inputs_car
  end

  private
  def validate_inputs_car
    raise ArgumentError 'id shall be an Integer' unless id.is_a? Integer
    raise ArgumentError 'price_per_day shall be an Integer' unless price_per_day.is_a? Integer
    raise ArgumentError 'price_per_km shall be an Integer' unless price_per_km.is_a? Integer
  end
end
