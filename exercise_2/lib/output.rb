# frozen_string_literal: true
require_relative 'read_operate'

class Output
  def print_hash2
    {'rentals'=> 
    (0..(call_array.length - 1)).map do |index|
      {
      'id'=> rental_prices2[1][index],
      'price'=> rental_prices2[0][index]
      }
    end
    }
  end

  def call
    call_array
  end

  private
  def rental_prices2
    y = call_array

    prices =
    [[
      y[0][1] * y[0][0] + y[0][2] * y[0][3],
      y[0][1] * y[0][0] + y[0][2] * y[1][3],
      y[0][1] * y[1][0] + y[1][2] * y[2][3]
    ],
    [
      y[0][4],
      y[1][4],
      y[2][4]
    ]]
  end

  def call_array
    ReadOperate.new.compute_array
  end

end
