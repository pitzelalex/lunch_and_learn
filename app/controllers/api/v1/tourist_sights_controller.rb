class Api::V1::TouristSightsController < ApplicationController
  def index
    country = TouristSightsFacade.country(params[:country])
  end
end
