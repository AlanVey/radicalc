require 'rails_helper'

RSpec.describe Profile, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:profile)).to be_valid
  end

  it 'can have a first_name' do
    expect(FactoryGirl.build(:profile, first_name: "Octavian")).to be_valid
  end

  it 'has a first_name' do
    expect(FactoryGirl.build(:profile, first_name: nil)).not_to be_valid
  end

  it 'can have a last_name' do
    expect(FactoryGirl.build(:profile, last_name: "Octavian")).to be_valid
  end

  it 'has a last_name' do
    expect(FactoryGirl.build(:profile, last_name: nil)).not_to be_valid
  end

  it 'can have a user_id' do
    expect(FactoryGirl.build(:profile, user_id: 1)).to be_valid
  end

  it 'can have a nil user_id' do
    expect(FactoryGirl.build(:profile, user_id: nil)).to be_valid
  end

  it 'can have a photo' do
    expect(FactoryGirl.build(:profile, photo: "MyProfilePhoto")).to be_valid
  end

  it 'can have a nil photo' do
    expect(FactoryGirl.build(:profile, photo: nil)).to be_valid
  end

end
