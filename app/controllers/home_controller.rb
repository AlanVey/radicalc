class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to dashboard_path, notice: 'Welcome to RadiCalc'
    end
  end
end
