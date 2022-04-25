# frozen_string_literal: true
require_relative '../lib/operate'

RSpec.describe Operate do
  subject(:prices) { described_class.new }

  describe '#final_price' do
    it 'Testing the array of prices' do
      expect(prices.final_price.sample).to be_an Integer
      expect(prices.final_price).to include
      [3000, 6800, 27800]
    end
  end

end
