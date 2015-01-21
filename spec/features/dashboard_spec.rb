require 'rails_helper'

feature 'Someone visits the dashboard' do

  before(:each) do
    @user = sign_in
  end

  scenario 'and adds a subject' do
    visit '/dashboard'

    click_link 'Add a New Topic'

    expect(page).to have_content 'Create new subject!'
  end


  scenario 'and looks at her topics' do
    visit '/dashboard'
    click_link 'My Topics'
    expect(page).to have_content 'Welcome to the RadiCalc homepage.'
  end

  scenario 'and looks at her topics' do
    visit '/dashboard'
    click_link 'Help and FAQ'
    expect(page).to have_content 'Frequently Asked Questions'
  end

  scenario 'and wants to see a subject' do
    @subject = FactoryGirl.create(:subject, user_id: @user.id)

    @user.add_role :admin, @subject

    visit "/subjects/#{@subject.id}"
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Body:'
    expect(page).to have_content 'User:'
  end

end