class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    require 'pry'; binding.pry
    if user.save
      render json: UserSerializer.new(User.last), status: 201
    end
  end

  private

  def user_params
    params[:user][:api_key] = User.generate_key
    params.require(:user).permit(:name, :email, :api_key)
  end
end
