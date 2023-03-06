require 'rails_helper'

describe 'Recepeis API' do
  describe 'sends a list of recepies' do
    it 'by country' do
      get '/api/v1/recepeis?country=thailand'

      expect(response).to be_successful

      recepies = JSON.parse(response.body, symbolize_names: true)

      expect(recepies).to have_key(:data)
      expect(recepies[:data]).to be_an Array
      expect(recepies[:data][0][:id]).to be null
      expect(recepies[:data][0][:type]).to eq('recipe')
      expect(recepies[:data][0][:attributes]).to be_a Hash
      expect(recepies[:data][0][:attributes][:title]).to be_a String
      expect(recepies[:data][0][:attributes][:url]).to be_a String
      expect(recepies[:data][0][:attributes][:country]).to be_a String
      expect(recepies[:data][0][:attributes][:image]).to be_a String
    end
  end
end
