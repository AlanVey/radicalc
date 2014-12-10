require 'rails_helper'

RSpec.describe "scores/show", :type => :view do
  before(:each) do
    @score = assign(:score, Score.create!(
      :user_id => 1,
      :test_id => 2,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Value/)
  end
end
