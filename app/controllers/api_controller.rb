class ApiController < ApplicationController
  include Concerns::ResourcefulActions

  protect_from_forgery with: :null_session

  before_action :json_format
  before_action :authenticate_user!

  check_authorization

  class NotAuthenticated < StandardError ; end

  {
    StandardError                => 500,
    ActiveRecord::RecordNotFound => 404,
    CanCan::AccessDenied         => 403,
    NotAuthenticated             => 401
  }.each do |klass, status|
    rescue_from klass do |e|
      # Don't double-render on already performed actions (like CanCan's ensure auth)
      raise e if performed?

      error = {
        error: e.class.name,
        message: e.message.strip
      }

      error[:backtrace] = e.backtrace if Rails.env.development? || Rails.env.test?

      render json: error, status: status
    end
  end


private

  def current_user
    @current_user ||= if token = request.headers["Authorization"]
      User.find_by_api_key token
    end
  end

  def authenticate_user!
    raise NotAuthenticated unless current_user
  end

  def json_format
    request.format = :json
  end
end
