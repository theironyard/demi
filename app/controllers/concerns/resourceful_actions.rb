module Concerns::ResourcefulActions
  extend ActiveSupport::Concern


  module ClassMethods
    def resource_class= klass
      @resource_class = klass
    end

    def resource_class
      @resource_class
    end

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

  def update_params
    create_params
  end
end
