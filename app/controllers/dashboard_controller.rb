class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @subjects = Subject.all
    @profile = Profile.new
  end
end
