# frozen_string_literal: true
require 'json'
require_relative '../lib/output'

RSpec.describe Output do
  subject(:final) { described_class.new }
  subject(:partial_result) {["commission"=>{"insurance_fee"=>450, "assistance_fee"=>100, "drivy_fee"=>350}]}
  describe '#ouput_rentals' do
    it 'Testing the hash of final values' do
      expect(final.output_rentals).to be_a Hash
      expect(final.output_rentals.first).to be_an Array
      expect(final.output_rentals.first).to include
      partial_result
    end
  end

end
