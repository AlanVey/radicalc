module SessionHelpers
  def sign_in(user = nil)
    @user = user.nil? ? FactoryGirl.create(:user) : user
    visit '/'
    click_link 'Go and log in'
    within('div#register') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
    end
    @user
  end

  def sign_up
    visit '/'
    within('div.registration') do  
      fill_in 'First name', with: 'John'
      fill_in 'Last name', with: 'Smith'   
      fill_in 'Email', with: 'abc@gmail.com'
      fill_in 'Password', with: '1234567890'
      fill_in 'Password confirmation', with: '1234567890'
      click_button 'Sign up'
    end
  end
end