json.(@timeline, :id, :course, :name, :created_at, :updated_at, :slug)
json.weeks do
  json.array! @timeline.weeks.includes(:goals, :assignments, :resources) do |week|
    json.number week.number

    json.goals       week.goals.pluck :description
    json.assignments week.assignments.pluck :description
    json.resources do
      json.array! week.resources do |resource|
        json.(resource, :url, :description)
      end
    end
  end
end
