require "rails_helper"

RSpec.describe SubscriptionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/subscriptions").to route_to("subscriptions#index")
    end

  end
end
