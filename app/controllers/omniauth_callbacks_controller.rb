class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    auth = env["omniauth.auth"]
    info = auth.info

    raise CanCan::AccessDenied unless info.email =~ /\@theironyard.com$/

    user = User.where(email: info.email).first_or_create! do |u|
      u.first_name = info.first_name
      u.last_name  = info.last_name
    end

    key = user.api_keys.generate!

    response.headers["Authorization"] = key.nonce
    redirect_to "http://0.0.0.0:9000?token=#{key.nonce}&expires=#{key.expires_at}"
  end
end
