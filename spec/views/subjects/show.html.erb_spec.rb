require 'rails_helper'

RSpec.describe "subjects/show", :type => :view do
  before(:each) do
    @subject = assign(:subject, Subject.create!(
      :name => "Name",
      :body => "MyText",
      :user_id => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
