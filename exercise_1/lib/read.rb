# frozen_string_literal: true
require 'json'

class Read
  def read_json
    JSON.parse(File.read file_json)
  end

  private

  def file_json
    './data/input.json'
  end
end
