class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      render json: UserSerializer.new(User.last), status: 201
    else
      render json: ErrorSerializer.new(user)
    end
  end

  private

  def user_params
    params[:user][:api_key] = User.generate_key
    params.require(:user).permit(:name, :email, :api_key)
  end
end
