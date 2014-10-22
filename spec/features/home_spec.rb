require 'rails_helper'

feature 'Someone visits the home page' do
  scenario 'and signs up' do
    visit '/'
    fill_in 'Email', with: '123@gmail.com'
    fill_in 'Password', with: '1234567890'
    fill_in 'Password confirmation', with: '1234567890'
    click_button 'Sign up'

    expect(page).to have_content 'Welcome to RadiCalc'
  end

  scenario 'blah blah blah' do
    @user = FactoryGirl.create(:user)
    
  end

end