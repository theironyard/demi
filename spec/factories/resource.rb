FactoryGirl.define do
  factory :resource do
    sequence(:url) { |n| "http://google.com?q=#{n}" }
    description "Google"
  end
end
