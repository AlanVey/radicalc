require 'rails_helper'

RSpec.describe "answers/new", :type => :view do
  before(:each) do
    assign(:answer, Answer.new(
      :question_id => 1,
      :user_id => 1,
      :value => "MyString",
      :status => "MyString"
    ))
  end

  it "renders new answer form" do
    render

    assert_select "form[action=?][method=?]", answers_path, "post" do

      assert_select "input#answer_question_id[name=?]", "answer[question_id]"

      assert_select "input#answer_user_id[name=?]", "answer[user_id]"

      assert_select "input#answer_value[name=?]", "answer[value]"

      assert_select "input#answer_status[name=?]", "answer[status]"
    end
  end
end
