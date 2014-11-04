class SessionsController < Devise::SessionsController
  
  def new
    redirect_to '/#toregister', notice: 'Please enter you user details correctly or Sign Up'
  end

end