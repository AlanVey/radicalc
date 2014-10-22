require 'rails_helper'

RSpec.describe Subject, :type => :model do
  it 'has non-null name' do
    Subject.new.name should_not be_nil
  end

  it 'has a user id' do
    @subject = FactoryGirl.create(:subject, user_id: nil)
    @subject.name = ''
    @subject.save

  end

  it 'has non-null description' do

  end

end
