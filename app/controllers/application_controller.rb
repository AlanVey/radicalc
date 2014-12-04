class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_observer
    if(@subject.readable_by?(current_user) == false)
      redirect_to dashboard_path, notice: "You do not have permission to see this subject."
    end
  end

end
