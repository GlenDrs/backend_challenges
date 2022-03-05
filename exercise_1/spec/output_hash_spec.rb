# frozen_string_literal: true
require_relative '../lib/output_json_hash'

RSpec.describe OutputJsonHash do
  subject(:output_json_file) { described_class.new }
  describe '#call_operate' do
    it 'Test calling hash from OutputJson class' do
      expect(output_json_file.call_operate).to include
      [
        [1, 2000, 3, 10, 100], [2, 1700, 3, 8, 150]
      ]
    end
  end

  describe '#rental_prices' do
    it 'Test the output of prices' do
      expect(output_json_file.rental_prices.first).to eq [7000, 15500, 11250]
    end
  end

  describe '#print_json' do
    it 'Test the output json hash' do
      expect(output_json_file.print_json).to include
      {
        "rentals": [{"id": 2, "price": 15500}]
      }      
    end
  end

end
