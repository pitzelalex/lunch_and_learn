require 'rails_helper'

describe 'tourist_sights API' do
  describe 'sends a list of tourist_sights' do
    it 'by radious from country capital', :vcr do
      get '/api/v1/tourist_sights?country=Canada'

      expect(response).to be_successful

      sights = JSON.parse(response.body, symbolize_names: true)

      expect(sights).to have_key(:data)
      expect(sights[:data]).to be_an Array
      expect(sights[:data][0][:id]).to be nil
      expect(sights[:data][0][:type]).to eq('tourist_sight')
      expect(sights[:data][0][:attributes]).to be_a Hash
      expect(sights[:data][0][:attributes][:name]).to be_a String
      expect(sights[:data][0][:attributes][:address]).to be_a String
      expect(sights[:data][0][:attributes][:place_id]).to be_a String
    end
  end
end
