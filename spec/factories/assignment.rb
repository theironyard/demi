FactoryGirl.define do
  factory :assignment do
    sequence(:description) { |n| "Desc #{n}" }
  end
end
