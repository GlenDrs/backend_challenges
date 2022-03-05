# frozen_string_literal: true
require_relative '../lib/operate'

RSpec.describe Operate do
  subject(:rental_cost) { described_class.new}
  describe '#compute_array' do
    it 'Testing creation array with variables' do
      expect(rental_cost.compute_array).to include
      [
        [1, 2000, 3, 10, 100], [2, 1700, 3, 8, 150]
      ]
    end
  end

end
