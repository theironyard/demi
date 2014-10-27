FactoryGirl.define do
  factory :course do
    sequence(:name) { |i| "Course #{i}" }
  end
end
