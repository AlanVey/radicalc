require 'rails_helper'

RSpec.describe "subjects/edit", :type => :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :name => "MyString",
      :body => "MyText",
      :user_id => "MyText"
    ))
  end

  it "renders the edit subject form" do
    render

    assert_select "form[action=?][method=?]", subject_path(@subject), "post" do

      assert_select "input#subject_name[name=?]", "subject[name]"

      assert_select "textarea#subject_body[name=?]", "subject[body]"

      assert_select "textarea#subject_user_id[name=?]", "subject[user_id]"
    end
  end
end
