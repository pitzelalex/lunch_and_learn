require 'rails_helper'

RSpec.describe 'Favorites API' do
  describe 'patch' do
    it 'creates a new favorite in the database and returns a confirmation message' do
      user_params = {
        name: 'Alex',
        email: 'pitzelalex@gmail.com'
      }
      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }
      post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
      user = JSON.parse(response.body, symbolize_names: true)

      favorite_params = {
        api_key: user[:data][:attributes][:api_key],
        country: 'thailand',
        recipe_link: 'http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/',
        recipe_title: 'Sriracha'
      }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)

      confirmation = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(confirmation).to eq({ success: 'Favorite added successfully' })
    end

    it 'returns an error message if no user matches api_key' do
      favorite_params = {
        api_key: 'invalid api key',
        country: 'thailand',
        recipe_link: 'http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/',
        recipe_title: 'Sriracha'
      }

      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite_params)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
      expect(error[:errors][0][:title]).to eq('not_found')
      expect(error[:errors][0][:detail]).to eq("Couldn't find User")
    end
  end
end
