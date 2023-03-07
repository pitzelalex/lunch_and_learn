class Api::V1::LearningResourcesController < ApplicationController
  def index
    resource = LearningResourceFacade.country(params[:country])

    render json: LearningResourceSerializer.new(resource)
  end
end
