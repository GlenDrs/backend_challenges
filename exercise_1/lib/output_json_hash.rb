# frozen_string_literal: true
require_relative 'operate'

class OutputJsonHash
  def call_operate
    Operate.new.compute_array
  end

  def rental_prices
    x = call_operate
    prices_array = []
    prices_array << 
    [ x[0][1] * x[0][0] + x[0][2] * x[0][3],
      x[1][1] * x[0][0] + x[0][2] * x[1][3],
      x[2][1] * x[1][0] + x[1][2] * x[2][3]
    ]
  end

  def print_json
    {"rentals"=> 
    (0..2).map do |index|
      {
      "id"=> (index + 1),
      "price"=> rental_prices.flatten[index]
      }
    end
    }
    #File.write('./data/output.json', JSON.dump(call_operate))
  end

end
