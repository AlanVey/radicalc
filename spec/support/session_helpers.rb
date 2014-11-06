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
  end

  def sign_up
    visit '/'
    within('div#login') do     
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password
      click_button 'Sign in'
    end
  end
end