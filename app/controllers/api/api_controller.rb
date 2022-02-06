module Api
  class ApiController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods
    include Pundit

    
    before_action :authorize_token, except: %i[index show]
    
    rescue_from Pundit::NotAuthorizedError, with: :not_authorized
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def current_user
      @current_user ||= authenticate_token
    end

    def not_found(error)
      render json: { errors: error.message }, status: :not_found
    end

    def authorize_token
      authenticate_token || invalid_token
    end

    def authenticate_token
      authenticate_with_http_token do |token, _options|
        user = User.find_by(token: token) # User | nil
      end
    end

    def not_authorized
      render json: { errors: "Not authorized"}, status: :unauthorized
    end

    def invalid_token
      render json: { errors: "Invalid token, please log in" }, status: :unauthorized
    end
  end
end