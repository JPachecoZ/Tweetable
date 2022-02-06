class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found(error)
    render json: { errors: error.message }, status: :not_found
  end
end