# frozen_string_literal: true
require 'json'
require 'date'

class Read
  def call
    p read_json_3
  end

  private
  def read_json_3
    JSON.parse(File.read './data/input.json')
  end

end
