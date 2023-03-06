require 'rails_helper'

RSpec.describe CapitalFacade do
  describe '#get' do
    it 'returns a hash of the lattitude and longditude', :vcr do
      returned = CapitalFacade.get('Canada')

      expect(returned).to be_a Hash
      expect(returned[:lat]).to eq(45.42)
      expect(returned[:long]).to eq(-75.7)
    end
  end
end
