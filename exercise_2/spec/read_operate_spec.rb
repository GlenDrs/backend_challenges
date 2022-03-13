# frozen_string_literal: true
require_relative '../lib/read_operate'

RSpec.describe ReadOperate do
  subject(:read) { described_class.new }
  subject(:array_part) { [[2000, 10, 100, 1], [17800, 10, 1000, 3]] }

  describe '#compute_array' do
    it 'Array return data test' do
      expect(read.compute_array.sample).not_to be_empty
      expect(read.compute_array).to include
      array_part
    end
  end
end
