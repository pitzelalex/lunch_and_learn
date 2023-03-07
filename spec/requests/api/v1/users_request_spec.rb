require 'rails_helper'

RSpec.describe 'Users API' do
  describe 'patch' do
    it 'creates and returns a new user in the database' do
      user_params = {
        name: 'Alex',
        email: 'pitzelalex@gmail.com'
      }

      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

      new_user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(new_user).to be_a Hash
      expect(new_user).to have_key(:data)
      expect(new_user[:data]).to be_a Hash
      expect(new_user[:data]).to have_key(:type)
      expect(new_user[:data][:type]).to eq('user')
      expect(new_user[:data]).to have_key(:id)
      expect(new_user[:data][:id]).to be_a String
      expect(new_user[:data]).to have_key(:attributes)
      expect(new_user[:data][:attributes]).to be_a Hash
      expect(new_user[:data][:attributes]).to have_key(:name)
      expect(new_user[:data][:attributes][:name]).to be_a String
      expect(new_user[:data][:attributes]).to have_key(:email)
      expect(new_user[:data][:attributes][:email]).to be_a String
      expect(new_user[:data][:attributes]).to have_key(:api_key)
      expect(new_user[:data][:attributes][:api_key]).to be_a String
    end
  end
end
