# frozen_string_literal: true
require_relative './lib/output_json_hash'

def output_json
  OutputJsonHash.new.print_json
end

p output_json
