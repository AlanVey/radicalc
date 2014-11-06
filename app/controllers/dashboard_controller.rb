class DashboardController < ApplicationController
  def index
    @subjects = Subject.all
  end
end
