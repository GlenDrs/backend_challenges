# frozen_string_literal: true
require 'date'
require_relative '../lib/read'
require_relative '../lib/rental'

RSpec.describe Rental do
  subject(:rental_object) { described_class.new(id: 1, car_id: 1, start_date: "2022-01-01", end_date: "2022-02-01", distance: 1) }
  describe '#initialize' do
    it 'testing initialize of Car' do
      expect(rental_object.id).to eq 1
      expect(rental_object.car_id).to eq 1
      expect(rental_object.start_date).to eq "2022-01-01"
      expect(rental_object.end_date).to eq "2022-02-01"
      expect(rental_object.distance).to eq 1
    end
  end

  describe '#nb_days' do
    it 'testing nb_days method' do
      expect(rental_object.nb_days).to be_an Integer
    end
  end
end
