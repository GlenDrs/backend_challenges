# frozen_string_literal: true
require 'date'
require_relative './lib/read'
require_relative './lib/operate'

def execute
  dt = Read.new.read_json_3
  Operate.new(dt).discount_prices_and_fees
end

p execute
