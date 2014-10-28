# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
{
  "Javascript" => ["Angular", "Backbone"],
  "Ruby" => ["Timeline", "Where We're Going We Don't Need Rails"]
}.each do |course, timelines|
  course = Course.where(name: course).first_or_create!
  timelines.each do |timeline|
    timeline = course.timelines.where(name: timeline).first_or_create!
    1.upto(12) { |n| timeline.weeks.where(number: n).first_or_create! }
  end
end
