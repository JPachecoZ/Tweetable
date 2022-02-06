module Api
  class SessionsController < ApiController
    skip_before_action :authorize_token, only: :create
    # POST /api/sessions => params: [email: xxx, password": xxx]
    def create
      user = User.find_by(email: params[:email])
      if user&.valid_password?(params[:password])
        user.regenerate_token
        render json: { token: user.token }
      else
        render json: { errors: "Invalid credentials" }, status: :unauthorized
      end
    end

    def destroy
      current_user.token = nil
      current_user.save
      head :no_content
    end
  end
end