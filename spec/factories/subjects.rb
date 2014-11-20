# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    name "MyString"
    body "MyText"
    author_id 1
    debate_type "technical"
  end
end
