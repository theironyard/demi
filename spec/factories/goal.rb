FactoryGirl.define do
  factory :goal do
    sequence(:description) { |n| "Desc #{n}" }
  end
end
