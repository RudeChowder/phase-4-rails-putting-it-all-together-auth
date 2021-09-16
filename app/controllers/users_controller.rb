class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  def show
    user = User.find(session[:user_id])
    render json: user, status: :created
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Not Authorized" }, status: :unauthorized
  end

private

  def user_params
    params.permit(:username, :password, :password_confirmation, :image_url, :bio)
  end
end
