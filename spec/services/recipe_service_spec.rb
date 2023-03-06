require 'rails_helper'

RSpec.describe RecipeService do
  describe '#get' do
    it 'returns an array of recipes', :vcr do
      response = RecipeService.get('Thailand')

      expect(response).to have_key(:_links)
      expect(response[:_links]).to have_key(:next)
      expect(response[:_links][:next]).to have_key(:href)

      expect(response).to have_key(:hits)
      expect(response[:hits].first).to have_key(:recipe)
      expect(response[:hits].first[:recipe]).to have_key(:label)
      expect(response[:hits].first[:recipe]).to have_key(:image)
      expect(response[:hits].first[:recipe]).to have_key(:url)
    end
  end
end
