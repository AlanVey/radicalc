# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    user_id 1
    uri "MyString"
    debate_id 1
    kind "General"
    subject_id 1
    title 'Question?'
  end
end
