require 'rails_helper'

RSpec.describe TestQuestion, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:test_question)).to be_valid
  end

  it 'can have a test' do
    expect(FactoryGirl.build(:test_question, test_id: 1)).not_to be_valid
  end

  it 'can have a user' do
    expect(FactoryGirl.build(:test_question, user_id: 1)).not_to be_valid
  end

  it 'can have a title' do
    expect(FactoryGirl.build(:test_question, title: "MyTitle")).not_to be_valid
  end

  it 'has a test' do
    expect(FactoryGirl.build(:test_question, test_id: nil)).not_to be_valid
  end

  it 'has a user' do
    expect(FactoryGirl.build(:test_question, user_id: nil)).not_to be_valid
  end

  it 'has a title' do
    expect(FactoryGirl.build(:test_question, title: nil)).not_to be_valid
  end

  it 'has a kind' do
    expect(FactoryGirl.build(:test_question, kind: nil)).not_to be_valid
  end
end
