# frozen_string_literal: true
require_relative '../lib/read'
require_relative '../lib/operate'

RSpec.describe Operate do
  subject(:prices) { described_class.new(Read.new.read_json_3) }

  describe '#discount_prices_and_fees' do
    it 'Testing discount_prices_and_fees' do
      expect(prices.discount_prices_and_fees).to be_a Hash
      expect(prices.discount_prices_and_fees).to include
      [3000, 6800, 27800]
    end
  end

end
