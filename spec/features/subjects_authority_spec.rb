feature 'there are three users, one of which creates a subject' do

  before(:each) do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user, email: "john@gmail.com")
    @user3 = FactoryGirl.create(:user, email: "alex@gmail.com")

    @subject = FactoryGirl.create(:subject, user_id: @user1.id)

    @user1.add_role :admin, @subject
    @user2.add_role :member, @subject

  end

  scenario 'the subject is visible to an admin and a member and no one else' do
    sign_in @user1
    visit "/subjects/#{@subject.id}"
    expect(page).to have_content 'Name:'

    log_out

    sign_in @user2
    visit "/subjects/#{@subject.id}"
    expect(page).to have_content 'Name:'

    log_out

    sign_in @user3
    visit "/subjects/#{@subject.id}"
    expect(page).to have_content 'You do not have permission to see this page.'
  end


  scenario 'only an admin can add subtopics' do
    sign_in @user1
    visit "/subjects/#{@subject.id}"
    expect(page).to have_content 'New Subject'

    log_out

    sign_in @user2
    visit "/subjects/#{@subject.id}"
    expect(page).not_to have_content 'New Subject'

    log_out

    sign_in @user3
    visit "/subjects/#{@subject.id}"
    expect(page).not_to have_content 'New Subject'
  end

  scenario 'only an admin can add users' do
    sign_in @user1
    visit "/subjects/#{@subject.id}"
    expect(page).to have_content 'Add Students'

    log_out

    sign_in @user2
    visit "/subjects/#{@subject.id}"
    expect(page).not_to have_content 'Add Students'

    log_out

    sign_in @user3
    visit "/subjects/#{@subject.id}"
    expect(page).not_to have_content 'Add Students'
  end

end