class ApiController < ApplicationController
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

  def index
    authorize! :read, resource_class
    self.objects = scope.all
  end

  def show
    authorize! :show, object
  end

  def create
    self.object = scope.new create_params
    authorize! :create, object
    object.save!
    render :show
  end

  def update
    authorize! :update, object
    object.update_attributes! update_params
    render :show
  end

  def destroy
    authorize! :delete, object
    object.destroy
    render :show
  end

private

  class << self
    attr_accessor :resource_class, :params

    def resource klass, opts={}
      self.resource_class = klass

      before_action only: [:show, :update, :destroy] do
        self.object = resource_class.find params[:id]
      end

      define_method :create_params do
        params.require(resource_name.singular).permit opts[:params]
      end if opts[:params]
    end
  end

  def resource_class
    self.class.resource_class
  end

  def scope
    self.class.resource_class
  end

  def resource_name
    self.class.resource_class.model_name
  end

  def objects= objs
    instance_variable_set :"@#{resource_name.plural}", objs
  end

  def objects
    instance_variable_get :"@#{resource_name.plural}"
  end

  def object= obj
    instance_variable_set :"@#{resource_name.singular}", obj
  end

  def object
    instance_variable_get :"@#{resource_name.singular}"
  end


  def current_user
    @current_user ||= if token = request.headers["Authorization"]
      User.find_by_api_key token
    end
  end

  def update_params
    create_params
  end

  def authenticate_user!
    raise NotAuthenticated unless current_user
  end

  def json_format
    request.format = :json
  end
end
