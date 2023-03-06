require 'rails_helper'

RSpec.describe CapitalService do
  describe '#get' do
    it 'returns fetches required details about a country', :vcr do
      response = CapitalService.get('Canada')

      expect(response).to be_an Array
      expect(response[0]).to have_key(:capitalInfo)
      expect(response[0][:capitalInfo]).to have_key(:latlng)
      expect(response[0][:capitalInfo][:latlng]).to be_an Array
    end
  end
end
