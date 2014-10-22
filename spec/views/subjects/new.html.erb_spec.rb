require 'rails_helper'

RSpec.describe "subjects/new", :type => :view do
  before(:each) do
    assign(:subject, Subject.new(
      :name => "MyString",
      :body => "MyText",
      :user_id => "MyText"
    ))
  end

  it "renders new subject form" do
    render

    assert_select "form[action=?][method=?]", subjects_path, "post" do

      assert_select "input#subject_name[name=?]", "subject[name]"

      assert_select "textarea#subject_body[name=?]", "subject[body]"

      assert_select "textarea#subject_user_id[name=?]", "subject[user_id]"
    end
  end
end
