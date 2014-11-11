require 'rails_helper'

RSpec.describe Profile, :type => :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:profile)).to be_valid
  end

  it 'has a last_name' do
    expect(FactoryGirl.build(:profile, first_name: nil)).not_to be_valid
  end

  it 'has a first_name' do
    expect(FactoryGirl.build(:profile, last_name: nil)).not_to be_valid
  end
end
