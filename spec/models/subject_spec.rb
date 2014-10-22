require 'rails_helper'

RSpec.describe Subject, :type => :model do
  it 'has a name' do
    @subject = FactoryGirl.create(:subject, user_id:nil)
    @subject.name should_not = nil
  end

  it 'has a user id' do
    @subject = FactoryGirl.create(:subject, user_id: nil)
    @subject.name = ''
    @subject.save
  end

  it 'can have no discription' do
    #do nothing
  end


end
