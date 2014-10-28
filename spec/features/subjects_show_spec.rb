require 'rails_helper'

feature 'Someone visits the first subject\'s page' do

  scenario 'and adds a subject' do
    @subject = FactoryGirl.create(:subject)
    visit "/subjects/#{@subject.id}"

    click_link 'New Subject'
    puts page.html
    expect(page).to have_content 'Create new subject!'
  end

end