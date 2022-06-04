# frozen_string_literal: true
require_relative '../lib/read_operate'
require_relative '../main'

RSpec.describe ReadOperate do
  subject(:read) { described_class.new(dt) }

  describe '#prices_with_discount' do
    it 'ReadOperate return data test' do
      expect(read.prices_with_discount).to be_a Hash
      expect(read.prices_with_discount).to include
      [{:id=>1, :price=>3000}, {:id=>2, :price=>6800}]
    end
  end
end
