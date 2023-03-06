class Api::V1::TouristSightsController < ApplicationController
  def index
    sights = TouristSightsFacade.country(params[:country])

    render json: TouristSightSerializer.new(sights)
  end
end
