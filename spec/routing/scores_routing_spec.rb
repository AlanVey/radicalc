require "rails_helper"

RSpec.describe ScoresController, :type => :routing do
  describe "routing" do

    it "routes to #new" do
      expect(:get => "question/show/:test_id/answers/:answer_id/new_score").to route_to("scores#new")
    end

    it "routes to #edit" do
      expect(:get => "question/show/:test_id/score/:id/edit_score").to route_to("scores#edit", :id => "1")
    end

  end
end
