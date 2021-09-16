class ApplicationController < ActionController::API
  include ActionController::Cookies

private

  def authorize
    return render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
  end

  def render_unprocessable_entity(err)
    render json: { errors: err.record.errors.full_messages }, status: :unprocessable_entity
  end
end
