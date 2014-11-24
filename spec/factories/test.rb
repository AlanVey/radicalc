# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :test do
    subject_id 1
    user_id 1
    title "MyString"
    kind "MyString"
  end
end
