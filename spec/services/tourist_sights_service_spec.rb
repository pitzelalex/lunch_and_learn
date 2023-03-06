require 'rails_helper'

RSpec.describe TouristSightsService do
  describe '#get' do
    it 'returns an array of tourist sights by country', :vcr do
      lat_long = { lat: 45.42, long: -75.7 }
      response = TouristSightsService.get(lat_long)

      expect(response).to be_a Hash
      expect(response).to have_key(:features)
      expect(response[:features]).to be_an Array
      response[:features].each do |feature|
        expect(feature).to be_a Hash
        expect(feature).to have_key(:properties)
        expect(feature[:properties]).to have_key(:name)
        expect(feature[:properties]).to have_key(:formatted)
        expect(feature[:properties]).to have_key(:place_id)
      end
    end
  end
end
