# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    # We use a sequence to make sure that every User that is created has a
    # unique email.
    sequence(:email) { |n| "email#{n}@example.com" }
    password "password123"
  end
end
