# frozen_string_literal: true
require 'json'

class Read
  def read_json_3
    JSON.parse(File.read file_json)
  end

  private
  def file_json
    './data/input.json'
  end
end
