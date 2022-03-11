# frozen_string_literal: true
require 'json'
require 'date'

class ReadOperate
  def compute_array
    compt_array = []
    (0..(cars2.length - 1)).each do |i|
      compt_array <<
      [
        cars2[i]['price_per_day'],
        count_days(i),
        cars2[i]['price_per_km'],
        rentals2[i]['distance'],
        rentals2[i]['id']
      ]
    end
    compt_array
  end

  private
  def count_days(index)
    (lastst_day(index) - first_day(index) + 1).to_i
  end

  def lastst_day(index)
    Date.strptime(rentals2[index]['end_date'], '%Y-%m-%d')
  end

  def first_day(index)
    Date.strptime(rentals2[index]['start_date'], '%Y-%m-%d')
  end

  def cars2
    read_json_2['cars']
  end

  def rentals2
    read_json_2['rentals']
  end

  def read_json_2
    JSON.parse(File.read './data/input.json')
  end
end