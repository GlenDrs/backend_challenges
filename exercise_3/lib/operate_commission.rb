# frozen_string_literal: true
require 'date'
require_relative './read'
require_relative './operate'

class OperateCommission

  #private
  def drivy_fee
    l = assistance_fee.length - 1
    (0..l).map do |i|
      inssurance_fee[i] - assistance_fee[i]
    end
  end

  def assistance_fee
    result_days.map do |nb_days|
      nb_days.to_f.to_i * 100
    end
  end

  def result_days
    call_days.map do |x|
      (Date.strptime(x[0],'%Y-%m-%d') - Date.strptime(x[1],'%Y-%m-%d') + 1)
    end
  end

  def call_days
    (Read.new.call['rentals']).map do |day|
      [day['end_date'], day['start_date']]
    end
  end


  def inssurance_fee
    call_final_prices.map do |final_price|
      ((final_price * 0.3) * 0.5).to_i
    end
  end

  def call_final_prices
    Operate.new.final_price
  end

end