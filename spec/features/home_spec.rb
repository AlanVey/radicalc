require 'rails_helper'

feature 'Someone visits the home page' do

  scenario 'and signs up' do
    visit '/'
    within 'div.registration' do
      fill_in 'Email', with: 'octavian@gmail.com'
      fill_in 'Password', with: '1234567890'
      fill_in 'Password confirmation', with: '1234567890'
      click_button 'Sign up'
    end
      expect(page).to have_content 'Welcome to RadiCalc'
  end


  before do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  scenario 'and logins n' do
    visit '/'
    within 'div.session' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign in'
    end
    expect(page).to have_content 'Welcome'
  end

end