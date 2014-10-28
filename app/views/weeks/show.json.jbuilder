json.course   @course.name
json.timeline @timeline.name
json.week     @week.number

json.goals       @week.goals.pluck :description
json.assignments @week.assignments.pluck :description
json.resources do
  json.array! @week.resources do |resource|
    json.(resource, :url, :description)
  end
end
