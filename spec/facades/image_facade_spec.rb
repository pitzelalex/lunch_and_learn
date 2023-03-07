require 'rails_helper'

RSpec.describe ImageFacade do
  describe '#country' do
    it 'returns an array of Image objects', :vcr do
      images = ImageFacade.get('canada')

      expect(images).to be_an Array
      images.each do |image|
        expect(image).to be_an Image
      end
    end
  end
end
