# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :score do
    user_id 1
    test_id 1
    value "MyString"
  end
end
