# frozen_string_literal: true
require_relative '../lib/output_hash'

RSpec.describe OutputHash do
  subject(:output_json_file) { described_class.new }
  subject(:print_hash_part) { {'rentals': [{'id': 2, 'rice': 15500}]} }
  describe '#print_hash' do
    it 'Test the hash output' do
      expect(output_json_file.print_hash).to be_a Hash
      expect(output_json_file.print_hash).to include
        print_hash_part
    end
  end
end
