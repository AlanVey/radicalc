require 'rails_helper'

feature 'Someone visits the dashboard' do

  before(:each) do
    @user = sign_in
  end

  scenario 'and adds a subject' do
    visit '/dashboard'

    click_link 'Add a New Topic'
    # first(:link, 'Add a New Topic').click

    expect(page).to have_content 'Create new subject!'
  end

  scenario 'and wants to see a subject' do
    @subject = FactoryGirl.create(:subject, user_id: @user.id)
    visit "/subjects/#{@subject.id}"
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Description:'
    expect(page).to have_content 'User:'
  end

end