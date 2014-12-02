require 'rails_helper'

feature 'Someone visits the first subject\'s page' do

  scenario 'and adds a subject' do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @subject = FactoryGirl.create(:subject, user_id: @user.id)
    visit "/subjects/#{@subject.id}"

    click_link 'New Subject'
    expect(page).to have_content 'Create new subject!'
  end

end