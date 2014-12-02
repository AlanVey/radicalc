class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @subscriptions = current_user.get_invited_subjects
    @subjects      = current_user.get_subscribed_subjects
  end
end
