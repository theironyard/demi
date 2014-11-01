class ResourcesController < ApiController
  resource Resource, params: [:url, :description]
end
