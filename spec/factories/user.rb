FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@theironyard.com" }
    password "-" * 10
    password_confirmation "-" * 10
  end

  trait(:peasant) { role 'peasant' }
  trait(:admin)   { role 'admin'   }
end
