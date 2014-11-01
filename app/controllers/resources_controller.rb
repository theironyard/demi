class ResourcesController < ApiController
  before_action :find_resource

  def object; @resource; end

private

  def find_resource
    @resource = Resource.find params[:id]
  end

  def create_params
    params.require(:resource).permit :url, :description
  end
end
