# frozen_string_literal: true
require 'json'

class ReadOperate

  private
  def read_json_2
    JSON.parse(File.read './data/input.json')
  end
end