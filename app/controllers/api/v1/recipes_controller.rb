class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      recipes = RecipeFacade.country(params[:country])

      render json: RecipeSerializer.new(recipes[:recipes])
    end
  end
end
