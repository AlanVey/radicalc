require 'rails_helper'

feature 'Someone visits the dashboard' do

  scenario 'and adds a subject' do
    visit '/dashboard'
    click_link 'New Subject'
    expect(page).to have_content 'Create new subject!'
  end

  scenario 'and wants to see a subject' do
    FactoryGirl.create(:subject)
    visit '/dashboard'
    click_link 'Show'
    expect(page).to have_content 'Name:'
    expect(page).to have_content 'Body:'
    expect(page).to have_content 'User:'
  end

end