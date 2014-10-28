desc "Add some dummy data for mocking"
task :fake => :environment do
  Week.find_each do |week|
    3.times do
      week.goals << Goal.create!(description: Faker::Company.catch_phrase)
    end

    5.times do
      week.resources << Resource.create!(
        url: Faker::Internet.url,
        description: Faker::Company.catch_phrase
      )
    end

    week.assignments << Assignment.create!(description: Faker::Lorem.paragraph(2))
    week.assignments << Assignment.create!(description: Faker::Internet.url)
  end
end
