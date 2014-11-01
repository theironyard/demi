FactoryGirl.define do
  factory :week do
    timeline
    number { rand(1..12) }

    after :create do |week|
      3.times { week.goals       << create(:goal)       }
      2.times { week.assignments << create(:assignment) }
      5.times { week.resources   << create(:resource)   }
    end
  end
end
