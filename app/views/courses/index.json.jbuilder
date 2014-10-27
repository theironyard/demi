json.array! @courses do |course|
  json.(course, :name, :created_at, :updated_at)
end
