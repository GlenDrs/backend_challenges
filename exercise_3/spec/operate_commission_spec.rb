# frozen_string_literal: true
require_relative '../lib/operate_commission'

RSpec.describe OperateCommission do
  subject(:h_commission) { described_class.new }
  subject(:partial_h_commissions) {{"insurance_fee"=>4170, "assistance_fee"=>1200, "drivy_fee"=>2970}}

  describe '#commission_h' do
    it 'Testing the hash of commissions' do
      expect(h_commission.commission_h).to be_an Array
      expect(h_commission.commission_h.sample).to be_an Hash
      expect(h_commission.commission_h).to include
      partial_h_commissions
    end
  end

end
