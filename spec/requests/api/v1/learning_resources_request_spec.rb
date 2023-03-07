require 'rails_helper'

describe 'Learning Resources API' do
  describe 'by country' do
    it 'returns details about a country', :vcr do
      get '/api/v1/learning_resources?country=canada'

      expect(response).to be_successful

      resource = JSON.parse(response.body, symbolize_names: true)

      expect(resource).to have_key(:data)
      expect(resource[:data]).to be_a Hash
      expect(resource[:data][:id]).to be nil
      expect(resource[:data][:type]).to eq('learning_resource')
      expect(resource[:data][:attributes]).to be_a Hash
      expect(resource[:data][:attributes][:country]).to eq('canada')
      expect(resource[:data][:attributes][:video]).to be_a Hash
      expect(resource[:data][:attributes][:video][:title]).to be_a String
      expect(resource[:data][:attributes][:video][:youtube_video_id]).to be_a String
      expect(resource[:data][:attributes][:images]).to be_an Array
      resource[:data][:attributes][:images].each do |image|
        expect(image).to be_a Hash
        expect(image[:alt_tag]).to be_a String
        expect(image[:url]).to be_a String
      end
    end
  end
end
