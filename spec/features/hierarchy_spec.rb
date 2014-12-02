require 'rails_helper'

feature 'someone visits the dashboard' do

  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  scenario 'and creates a hierarchy with one subject' do
    visit '/dashboard'
    click_link 'Add a New Topic'
    fill_in 'Name', with: 'N1'
    fill_in 'Body', with: 'B1'
    click_button 'Create Subject'
    expect(Subject.all.count).to eq(1)
    expect(Subject.first.name).to eq('N1')
    expect(Subject.first.parent_id).to eq(nil)
  end

  scenario 'and creates two hierarchies with one subject each' do
    visit '/dashboard'
    click_link 'Add a New Topic'
    fill_in 'Name', with: 'N1'
    fill_in 'Body', with: 'B1'
    click_button 'Create Subject'
    click_link 'Back'
    click_link 'Add a New Topic'
    fill_in 'Name', with: 'N2'
    fill_in 'Body', with: 'B2'
    click_button 'Create Subject'
    expect(Subject.all.count).to eq(2)
    expect(Subject.first.name).to eq('N1')
    expect(Subject.first.parent_id).to eq(nil)
    expect(Subject.second.name).to eq('N2')
    expect(Subject.second.parent_id).to eq(nil)
  end

  scenario 'and creates a hierarchy with child, parent, grandparent' do
    visit '/dashboard'
    find(:xpath, "//a[@href='/subjects/new']", :text =>"Add a New Topic").click
    fill_in 'Name', with: 'N1'
    fill_in 'Body', with: 'B1'
    click_button 'Create Subject'
    click_link 'New Subject'
    fill_in 'Name', with: 'N2'
    fill_in 'Body', with: 'B2'
    click_button 'Create Subject'
    click_link 'New Subject'
    fill_in 'Name', with: 'N3'
    fill_in 'Body', with: 'B3'
    click_button 'Create Subject'

    expect(Subject.all.count).to eq(3)
    expect(Subject.first.name).to eq('N1')
    expect(Subject.first.parent_id).to eq(nil)
    expect(Subject.second.name).to eq('N2')
    expect(Subject.second.parent_id).to eq(Subject.first.id)
    expect(Subject.third.name).to eq('N3')
    expect(Subject.third.parent_id).to eq(Subject.second.id)
  end


  scenario 'and creates a hierarchy with a parent and two children' do
    visit '/dashboard'
    find(:xpath, "//a[@href='/subjects/new']", :text =>"Add a New Topic").click
    fill_in 'Name', with: 'N1'
    fill_in 'Body', with: 'B1'
    click_button 'Create Subject'

    click_link 'New Subject'
    fill_in 'Name', with: 'N2'
    fill_in 'Body', with: 'B2'
    click_button 'Create Subject'

    click_link 'N1'#the name of the parent

    click_link 'New Subject'
    fill_in 'Name', with: 'N3'
    fill_in 'Body', with: 'B3'
    click_button 'Create Subject'

    expect(Subject.all.count).to eq(3)
    expect(Subject.first.name).to eq('N1')
    expect(Subject.first.parent_id).to eq(nil)
    expect(Subject.second.name).to eq('N2')
    expect(Subject.second.parent_id).to eq(Subject.first.id)
    expect(Subject.third.name).to eq('N3')
    expect(Subject.third.parent_id).to eq(Subject.first.id)
  end

  scenario 'and creates a parent and a child, checks if child\'s page has link to parent\'s page' do
    visit '/dashboard'
    find(:xpath, "//a[@href='/subjects/new']", :text =>"Add a New Topic").click
    fill_in 'Name', with: 'N1'
    fill_in 'Body', with: 'B1'
    click_button 'Create Subject'

    click_link 'New Subject'
    fill_in 'Name', with: 'N2'
    fill_in 'Body', with: 'B2'
    click_button 'Create Subject'

    expect(page).to have_content 'Parent Topic:'
    click_link 'N1'
    expect(page).to have_content 'N1'
    expect(page).to have_content 'B1'
  end


  scenario 'and creates a parent and a child, checks if child\'s page has link to parent\'s page' do
    visit '/dashboard'
    find(:xpath, "//a[@href='/subjects/new']", :text =>"Add a New Topic").click
    fill_in 'Name', with: 'N1'
    fill_in 'Body', with: 'B1'
    click_button 'Create Subject'

    click_link 'New Subject'
    fill_in 'Name', with: 'N2'
    fill_in 'Body', with: 'B2'
    click_button 'Create Subject'

    click_link 'N1'
    expect(page).to have_content 'Subtopics:'
    click_link 'N2'
    expect(page).to have_content 'N2'
    expect(page).to have_content 'B2'
  end

  scenario 'and creates a parent and a child, checks that only the parent\'s page is accessible from the dashbord' do
    visit '/dashboard'
    find(:xpath, "//a[@href='/subjects/new']", :text =>"Add a New Topic").click
    fill_in 'Name', with: 'N1'
    fill_in 'Body', with: 'B1'
    click_button 'Create Subject'

    click_link 'New Subject'
    fill_in 'Name', with: 'N2'
    fill_in 'Body', with: 'B2'
    click_button 'Create Subject'

    click_link 'N1'
    click_link 'Back'
    expect(page).not_to have_content 'N2'
    expect(page).not_to have_content 'B2'
  end

end