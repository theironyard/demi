FactoryGirl.define do
  factory :timeline do
    course
    sequence(:name) { |i| "Timeline #{i}" }
  end
end
