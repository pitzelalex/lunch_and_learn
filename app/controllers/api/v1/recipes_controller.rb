class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      recipes = get_recipes(params[:country])
    else
      country = CountryFacade.random

      recipes = get_recipes(country)
    end
    render json: RecipeSerializer.new(recipes[:recipes])
  end

  private

  def get_recipes(country)
    RecipeFacade.country(country)
  end
end
