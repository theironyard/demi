FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@theironyard.com" }
  end

  trait(:peasant) { role 'peasant' }
  trait(:admin)   { role 'admin'   }
end
