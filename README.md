# README

## Learning Goals
* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality

## Set up instructions
1. fork and clone the repo
1. run `bundle install`
1. run `bundle exec figaro install`
1. Add api keys to `application.yml`
 ```
edamam_app_id: <edamam_app_id>
edamam_app_key: <edamam_api_key>
places_api_key: <places_api_key>
youtube_api_key: <google_api_key>
unsplash_access_key: <unsplash_access_key>
 ```
5. run `rails s` to start the server on `http://localhost:3000/`

## Accessable Endpoints
* Search recepies by country: `GET /api/v1/recipes?country=<country>`
* Learning resources for a country: `GET /api/v1/learning_resources?country=<country>`
* Register a new user: `POST /api/v1/users`
```
request body =>
{
  "name": "Username",
  "email": "user@email.com"
}
```
* Add a new favorite recipe: `POST /api/v1/favorites`
```
request body =>
{
    "api_key": <provided in response when registering>,
    "country": "thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
}
```
* Get all favorites for a user: `GET /api/v1/favorites?api_key=<api_key>`

## Built With
```
Ruby on Rails
Faraday
Webmock
VCR
RSpec
```
