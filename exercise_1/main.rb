# frozen_string_literal: true
require_relative './lib/read'
require_relative './lib/operate'

def execute
  cars_rnts = Read.new.read_json
  Operate.new(cars_rnts).prices
end

p execute
