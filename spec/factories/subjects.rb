# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    name "MyString"
    body "MyText"
    user_id 1
  end
end
