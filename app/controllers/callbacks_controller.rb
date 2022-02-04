class CallbacksController < Devise::OmniauthCallbacksController
  def github
    auth_hash = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth_hash)
    sign_in_and_redirect(@user)
  end
end
