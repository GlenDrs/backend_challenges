# frozen_string_literal: true
require_relative '../lib/car'

RSpec.describe Car do
  subject(:car_object) { described_class.new(1,1,1) }
  describe '#initialize' do
    it 'testing initialize of Car' do
      expect(car_object.id).to eq 1
      expect(car_object.id).to eq 1
      expect(car_object.id).to eq 1
    end
  end
end