# frozen_string_literal: true
require 'date'
require_relative 'read'

class Operate


  def final_price
    rentals3.map.with_index do |price_km,i|
      price_km["distance"] * cars3.first["price_per_km"] + promo_price[i]
    end
  end

  private
  def promo_price
    x = cars3.first['price_per_day']
    (0..(rentals3.length - 1)).map do |i|
      if count_days(i) < 4
        (x * (0.9 * i) + x).to_i
      elsif count_days(i) > 10
        (x * (1 + 0.9 * 3 + 0.7 * 6 + ((count_days(i) - 10)* 0.5))).round
      end
    end
  end

  def count_days(index)
    (last_day(index) - first_day(index) + 1).to_i
  end

  def last_day(index)
    Date.strptime(rentals3[index]['end_date'], '%Y-%m-%d')
  end

  def first_day(index)
    Date.strptime(rentals3[index]['start_date'], '%Y-%m-%d')
  end

  def cars3
    Read.new.call['cars']
  end

  def rentals3
    Read.new.call['rentals']
  end

end
