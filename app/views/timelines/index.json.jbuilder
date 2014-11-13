json.array! @timelines.includes(:course) do |timeline|
  json.(timeline, :id, :course, :name, :created_at, :updated_at, :slug)
end
