# frozen_string_literal: true
require_relative '../lib/read'

RSpec.describe Read do
  subject(:json_doc) { described_class.new }
  subject(:partial_hash) { [{'id'=>2, 'price_per_day'=>3000, 'price_per_km'=>15},
  { 'id': 3, 'price_per_day': 1700, 'price_per_km': 8 }] }
  subject(:global_hash) { { 'cars'=> [], 'rentals'=> [] } }
  describe '#read_json' do
    it 'Read json file test' do
      expect(json_doc.read_json).to include
        partial_hash
      expect(json_doc.read_json).to include
        global_hash
    end
  end
end
