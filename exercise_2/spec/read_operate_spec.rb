# frozen_string_literal: true
require_relative '../lib/read_operate'
require_relative '../main'

RSpec.describe ReadOperate do
  subject(:read) { described_class.new(dt) }
  #subject(:array_part) { [[2000, 10, 100, 1], [17800, 10, 1000, 3]] }

  describe '#export' do
    it 'ReadOperate return data test' do
      expect(read.export).to be_a Hash
      expect(read.export).to include
      [{:id=>1, :price=>3000}, {:id=>2, :price=>6800}]
    end
  end
end
