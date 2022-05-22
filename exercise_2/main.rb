# frozen_string_literal: true
require_relative './lib/read_operate'
require_relative './lib/rental'
require_relative './lib/car'
require 'json'

dt = JSON.parse(File.read './data/input.json')
ReadOperate.new(dt).test
