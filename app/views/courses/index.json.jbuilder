json.array! @courses.includes(timelines: :weeks) do |course|
  json.(course, :id, :name, :created_at, :updated_at)
  json.timelines do
    json.array! course.timelines do |timeline|
      json.name timeline.name
      json.weeks timeline.weeks.pluck :number
    end
  end
end
