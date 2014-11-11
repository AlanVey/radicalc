# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "abc@gmail.com"
    password '1234567890'
    profile
  end
end
