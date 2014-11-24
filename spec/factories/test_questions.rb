# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test_question do
    title "MyString"
    kind "MyString"
    user_id 1
    answer "MyText"
    test_id 1
    status 'Test'
  end
end
