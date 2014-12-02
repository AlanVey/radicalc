require 'rails_helper'

RSpec.describe "subscriptions/index", :type => :view do
  before(:each) do
    assign(:subscriptions, [
      Subscription.create!(
        :subject_id => 1,
        :user_id => 2
      ),
      Subscription.create!(
        :subject_id => 1,
        :user_id => 2
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
