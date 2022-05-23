# frozen_string_literal: true
require 'date'
require_relative './lib/car'
require_relative './lib/rental'
require_relative './lib/operate'
require_relative './lib/output'

#p Output.new.output_rentals
dt = Read.new.read_json_3