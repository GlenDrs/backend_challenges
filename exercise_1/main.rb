# frozen_string_literal: true
require_relative './lib/car'
require_relative './lib/rental'
require_relative './lib/read'
#require_relative './lib/output_hash'
require_relative './lib/operate'

cars_rnts = Read.new.read_json

p Operate.new(cars_rnts).prices
