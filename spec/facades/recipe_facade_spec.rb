require 'rails_helper'

RSpec.describe RecipeFacade do
  describe '#country' do
    it 'returns a hash with Recipe objects and a next page url', :vcr do
      returned = RecipeFacade.country('thailand')

      expect(returned).to be_a Hash
      expect(returned[:recipes]).to be_an Array
      expect(returned[:recipes].first).to be_a Recipe
      expect(returned[:next_page]).to be_a String
    end
  end
end
