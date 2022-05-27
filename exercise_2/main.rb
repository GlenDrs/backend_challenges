# frozen_string_literal: true
require_relative './lib/read_operate'
require_relative './lib/rental'
require_relative './lib/car'
require 'json'

def dt
  JSON.parse(File.read './data/input.json')
end

def execute
  p ReadOperate.new(dt).prices_with_discount
end

execute
