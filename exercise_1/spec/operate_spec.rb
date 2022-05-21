# frozen_string_literal: true
require 'date'
require_relative '../lib/read'
require_relative '../lib/operate'

RSpec.describe Operate do
  subject(:rental_cost) { described_class.new(Read.new.read_json)}
  describe '#export' do
    it 'exporting results' do
      expect(rental_cost.export).to be_a Hash
      expect(rental_cost.export).to include
        [{:id=>1, :price=>7000}, {:id=>2,:price=>15500}]
    end
  end
end
