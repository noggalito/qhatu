FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@qhatu.org" }
    sequence(:password) { |n| "user-password-#{n}" }
    password_confirmation { password }
  end
end
