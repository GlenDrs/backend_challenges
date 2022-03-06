# frozen_string_literal: true
require_relative '../lib/operate'

RSpec.describe Operate do
  subject(:rental_cost) { described_class.new }
  subject(:compute_values) {[[2000, 3, 10, 100, 1], [1700, 3, 8, 150, 3]]}
  describe '#compute_array' do
    it 'Testing the arrays results' do
      expect(rental_cost.compute_array).to include
      compute_values
    end
  end
end
