json.array! @courses.includes(timelines: :weeks) do |course|
  json.(course, :id, :name, :created_at, :updated_at, :slug)
  json.timelines course.timelines do |timeline|
    json.name timeline.name
    json.weeks timeline.weeks.pluck :number
  end
end
