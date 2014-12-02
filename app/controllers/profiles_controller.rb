class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def show_user
    @profile = Profile.find_by(user_id:params[:id])
    @external = true
    render :show
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit 
    end
  end

  private
    def set_profile
      @profile = Profile.find_by(user_id:current_user.id)
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :photo)
    end
end
