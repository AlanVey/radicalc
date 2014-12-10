require 'rails_helper'

RSpec.describe "scores/index", :type => :view do
  before(:each) do
    assign(:scores, [
      Score.create!(
        :user_id => 1,
        :test_id => 2,
        :value => "Value"
      ),
      Score.create!(
        :user_id => 1,
        :test_id => 2,
        :value => "Value"
      )
    ])
  end

  it "renders a list of scores" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
