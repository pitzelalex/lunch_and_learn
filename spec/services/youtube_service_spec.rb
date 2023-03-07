require 'rails_helper'

RSpec.describe YoutubeService do
  describe '#get' do
    it 'returns an array of youtube video details based on search criteria', :vcr do
      response = YoutubeService.get('Canada')

      expect(response).to be_a Hash
      expect(response[:kind]).to eq('youtube#searchListResponse')
      expect(response[:items]).to be_an Array
      response[:items].each do |item|
        expect(item).to be_a Hash
        expect(item).to have_key(:id)
        expect(item[:id]).to be_a Hash
        expect(item[:id]).to have_key(:videoId)
        expect(item[:id][:videoId]).to be_a String
        expect(item).to have_key(:snippet)
        expect(item[:snippet]).to be_a Hash
        expect(item[:snippet]).to have_key(:title)
        expect(item[:snippet][:title]).to be_a String
      end
    end
  end
end
