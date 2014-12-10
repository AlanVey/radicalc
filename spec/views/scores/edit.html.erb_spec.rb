require 'rails_helper'

RSpec.describe "scores/edit", :type => :view do
  before(:each) do
    @score = assign(:score, Score.create!(
      :user_id => 1,
      :test_id => 1,
      :value => "MyString"
    ))
  end

  it "renders the edit score form" do
    render

    assert_select "form[action=?][method=?]", score_path(@score), "post" do

      assert_select "input#score_user_id[name=?]", "score[user_id]"

      assert_select "input#score_test_id[name=?]", "score[test_id]"

      assert_select "input#score_value[name=?]", "score[value]"
    end
  end
end
