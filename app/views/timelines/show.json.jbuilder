json.(@timeline, :id, :course, :name, :created_at, :updated_at, :slug)
json.weeks @timeline.weeks.includes(:goals, :assignments, :resources) do |week|
  json.number week.number

  json.goals week.goals do |goal|
    json.(goal, :id, :description)
  end
  json.assignments week.assignments do |assignment|
    json.(assignment, :id, :description)
  end
  json.resources week.resources do |resource|
    json.(resource, :id, :url, :description)
  end
end
