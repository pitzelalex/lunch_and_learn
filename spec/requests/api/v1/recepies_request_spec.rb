require 'rails_helper'

describe 'Recipes API' do
  describe 'sends a list of recipes' do
    it 'by country' do
      get '/api/v1/recipes?country=thailand'

      expect(response).to be_successful

      recipes = JSON.parse(response.body, symbolize_names: true)

      expect(recipes).to have_key(:data)
      expect(recipes[:data]).to be_an Array
      expect(recipes[:data][0][:id]).to be nil
      expect(recipes[:data][0][:type]).to eq('recipe')
      expect(recipes[:data][0][:attributes]).to be_a Hash
      expect(recipes[:data][0][:attributes][:title]).to be_a String
      expect(recipes[:data][0][:attributes][:url]).to be_a String
      expect(recipes[:data][0][:attributes][:country]).to be_a String
      expect(recipes[:data][0][:attributes][:image]).to be_a String
    end
  end
end
