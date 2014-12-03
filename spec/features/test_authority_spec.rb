feature 'there are two users, an admin and a member' do

  before(:each) do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user, email: "john@gmail.com")

    @subject = FactoryGirl.create(:subject, user_id: @user1.id)

    @user1.add_role :admin, @subject
    @user2.add_role :member, @subject

  end

  scenario 'only admin can create test' do
    sign_in @user1
    visit "/subjects/#{@subject.id}/tests"
    expect(page).to have_content 'New Test'

    log_out

    sign_in @user2
    visit "/subjects/#{@subject.id}/tests"
    expect(page).not_to have_content 'New Test'
  end

end