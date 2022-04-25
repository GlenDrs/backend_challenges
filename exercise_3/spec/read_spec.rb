# frozen_string_literal: true
require_relative '../lib/read'

RSpec.describe Read do
  subject(:read) { described_class.new }
  subject(:hash_part) {{"id"=>3, "car_id"=>1, "start_date"=>"2015-07-3", "end_date"=>"2015-07-14", "distance"=>1000}}

  describe '#call' do
    it 'Calling Json' do
      expect(read.call).to be_an Hash
      expect(read.call).to include
      hash_part
    end
  end

end
