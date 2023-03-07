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

  describe 'index' do
    it 'returns a list of a users favorites' do
      user = User.create(name: 'Alex', email: 'email', api_key: '12345')
      3.times do |t|
        user.favorites.create(recipe_title: "food #{t + 1}", recipe_link: "url#{t + 1}", country: "country #{t + 1}")
      end
      user2 = User.create(name: 'Other', email: 'other_email', api_key: '54321')
      3.times do |t|
        user2.favorites.create(recipe_title: "Other food #{t + 1}", recipe_link: "other url#{t + 1}", country: "other country #{t + 1}")
      end

      headers = { 'CONTENT_TYPE' => 'application/json', 'Accept' => 'application/json' }

      get "/api/v1/favorites?api_key=#{user.api_key}", headers: headers

      favorites = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(favorites[:data].count).to eq(3)
      expect(favorites[:data][0]).to have_key(:id)
      expect(favorites[:data][0][:id]).to be_a String
      expect(favorites[:data][0][:type]).to eq('favorite')
      expect(favorites[:data][0][:attributes][:recipe_title]).to eq('food 1')
      expect(favorites[:data][0][:attributes][:recipe_link]).to eq('url1')
      expect(favorites[:data][0][:attributes][:country]).to eq('country 1')
      expect(favorites[:data][0][:attributes][:created_at]).to be_a String
      expect(favorites[:data][1][:attributes][:recipe_title]).to eq('food 2')
      expect(favorites[:data][2][:attributes][:recipe_title]).to eq('food 3')
    end
  end
end
