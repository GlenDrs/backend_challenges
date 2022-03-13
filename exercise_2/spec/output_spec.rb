# frozen_string_literal: true
require_relative '../lib/output'

RSpec.describe Output do
  subject(:out_hash) { described_class.new.print_hash2 }
  subject(:hash_part) { [{'id'=>1, 'price'=>3000}, {'id'=>3, 'price'=>27800}] }

  describe '#print_hash2' do
    it 'testing hash return, new prices' do
      expect(out_hash).to be_a Hash
      expect(out_hash['rentals']).to be_a Array
      expect(out_hash).to include
      hash_part
    end
  end
end
