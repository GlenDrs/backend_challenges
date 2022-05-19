# frozen_string_literal: true
require 'date'
require_relative './lib/read'
require_relative './lib/operate'

def execute
  cars_rnts = Read.new.read_json
  p Operate.new(cars_rnts).export
end

execute
