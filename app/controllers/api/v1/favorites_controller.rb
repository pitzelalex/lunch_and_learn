class Api::V1::FavoritesController < ApplicationController
  def create
    begin
      if user = User.find_by!(api_key: params[:api_key])
        favorite = user.favorites.create(favorite_params)
        render json: { success: 'Favorite added successfully' }, status: 201
      end
    rescue ActiveRecord::RecordNotFound => e
      render_not_found_response(e)
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end

  def render_not_found_response(exception)
    render json: { errors: [
      {
        title: 'not_found',
        detail: exception.message
      }
    ] }, status: 404
  end
end
