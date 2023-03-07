require 'rails_helper'

RSpec.describe ImageService do
  describe '#get' do
    it 'returns an array of images by query', :vcr do
      images = ImageService.get('canada')

      expect(images).to be_a Hash
      expect(images).to have_key(:results)
      expect(images[:results]).to be_an Array
      expect(images[:results].count).to be <= 10
      images[:results].each do |image|
        expect(image).to be_a Hash
        expect(image).to have_key(:alt_description)
        expect(image[:alt_description]).to be_a String
        expect(image).to have_key(:urls)
        expect(image[:urls]).to be_a Hash
        expect(image[:urls]).to have_key(:full)
        expect(image[:urls][:full]).to be_a String
      end
    end
  end
end
