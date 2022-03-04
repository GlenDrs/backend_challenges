# frozen_string_literal: true
require_relative '../lib/read'

RSpec.describe Read do
  subject(:json_doc) { described_class.new }
  describe '#read_json' do
    it 'Read json file test' do
      expect(json_doc.read_json).to be_a Hash
      expect(json_doc.read_json).to include
      [
        {"id"=>1, "price_per_day"=>2000, "price_per_km"=>10},
        {"id"=>2, "price_per_day"=>3000, "price_per_km"=>15}
      ]
      expect(json_doc.read_json).to include
      {
        "cars"=> [],
        "rentals"=> []
      }
    end
  end
end