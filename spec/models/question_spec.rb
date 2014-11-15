require 'rails_helper'

RSpec.describe Question, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:question)).to be_valid
  end

  it 'has a user_id' do
    expect(FactoryGirl.build(:question, user_id: nil)).not_to be_valid
  end

  it 'has a subject_id' do
    expect(FactoryGirl.build(:question, subject_id: nil)).not_to be_valid
  end

  it 'has a debate_id' do
    expect(FactoryGirl.build(:question, debate_id: nil)).not_to be_valid
  end

  it 'has a uri' do
    expect(FactoryGirl.build(:question, uri: nil)).not_to be_valid
  end

  it 'has a kind' do
    expect(FactoryGirl.build(:question, kind: nil)).not_to be_valid
  end

  it 'has a title' do
    expect(FactoryGirl.build(:question, title: nil)).not_to be_valid
  end

  it 'has a valid kind' do
    expect(FactoryGirl.build(:question, kind: 'Monkey')).not_to be_valid
    expect(FactoryGirl.build(:question, kind: 'General')).to be_valid
  end
end
