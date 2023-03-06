require 'rails_helper'

RSpec.describe TouristSightsFacade do
  describe '#country' do
    it 'returns an array of tourist sights based on country', :vcr do
      sights = TouristSightsFacade.country('Canada')

      expect(sights).to be_an Array
      expect(sights.first).to be_a TouristSight
      expect(sights.last).to be_a TouristSight
    end
  end
end
