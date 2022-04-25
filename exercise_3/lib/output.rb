# frozen_string_literal: true
require_relative './operate_commission'
require_relative './operate'

class Output

  def output_rentals
    {"rentals" => gather_rentals}
  end

  private
  def gather_rentals
    (0..2).map do |i|
      {"id" => call_cars_ids[i],
      "price" => call_final_price[i],
      "commission" => (call_commission_h[i])
    }
    end
  end

  def call_cars_ids
    (0..2).map do |i|
      Read.new.call['rentals'][i]['id']
    end
  end

  def call_final_price
    Operate.new.final_price
  end

  def call_commission_h
    OperateCommission.new.commission_h
  end

end
