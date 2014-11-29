require 'rails_helper'

RSpec.describe "answers/show", :type => :view do
  before(:each) do
    @answer = assign(:answer, Answer.create!(
      :question_id => 1,
      :user_id => 2,
      :value => "Value",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Value/)
    expect(rendered).to match(/Status/)
  end
end
