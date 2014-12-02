require 'rails_helper'

feature 'Someone visits the home page' do

  scenario 'and signs up' do
    sign_up
    expect(page).to have_content 'Welcome to RadiCalc'
  end


  before do
    User.create(:email => 'user@example.com', :password => 'password')
  end

  scenario 'and logins in' do
    sign_in
    expect(page).to have_content 'Welcome'
  end

end