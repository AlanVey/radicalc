require 'rails_helper'
require 'closure_tree/test/matcher'

RSpec.describe Subject, :type => :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:subject)).to be_valid
  end

  it 'has a name' do
    expect(FactoryGirl.build(:subject, name: nil)).not_to be_valid
  end

  it 'has a body' do
    expect(FactoryGirl.build(:subject, body: nil)).not_to be_valid
  end

  it 'has a user id' do
    expect(FactoryGirl.build(:subject, user_id: nil)).not_to be_valid
  end

  it { is_expected.to be_a_closure_tree }

end
