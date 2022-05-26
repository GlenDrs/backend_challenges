# frozen_string_literal: true
require 'date'
require_relative './lib/read'
require_relative './lib/operate'

dt = Read.new.read_json_3
p Operate.new(dt).result1
