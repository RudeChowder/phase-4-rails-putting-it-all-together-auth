class RecipesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  before_action :authorize

  def index
    recipes = Recipe.where(user_id: session[:user_id])
    render json: recipes
  end

  def create
    user = User.find(session[:user_id])
    recipe = user.recipes.create!(recipe_params)
    render json: recipe, status: :created
  end

private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end
end
