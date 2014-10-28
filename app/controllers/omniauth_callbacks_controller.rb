class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    auth = env["omniauth.auth"]
    info = auth.info

    raise CanCan::AccessDenied unless info.email =~ /\@theironyard.com$/

    user = User.where(email: info.email).first_or_create! do |u|
      u.first_name = info.first_name
      u.last_name  = info.last_name
      u.password   = Devise.friendly_token
    end

    key = user.api_keys.generate!

    render json: user.as_json.merge(token: key.nonce)
  end
end