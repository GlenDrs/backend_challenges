# frozen_string_literal: true
require_relative './lib/read_operate'
require_relative './lib/rental'
require_relative './lib/car'
require 'json'

def execute
  dt = JSON.parse(File.read './data/input.json')
  p ReadOperate.new(dt).export
end

execute
