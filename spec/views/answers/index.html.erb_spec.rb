require 'rails_helper'

RSpec.describe "answers/index", :type => :view do
  before(:each) do
    assign(:answers, [
      Answer.create!(
        :question_id => 1,
        :user_id => 2,
        :value => "Value",
        :status => "Status"
      ),
      Answer.create!(
        :question_id => 1,
        :user_id => 2,
        :value => "Value",
        :status => "Status"
      )
    ])
  end

  it "renders a list of answers" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
