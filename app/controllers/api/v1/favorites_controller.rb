class Api::V1::FavoritesController < ApplicationController
  def create
    if user = User.find_by(api_key: params[:api_key])
      favorite = user.favorites.create(favorite_params)
      render json: { success: 'Favorite added successfully' }
    else
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end
