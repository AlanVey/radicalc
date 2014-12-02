class SubscriptionsController < ApplicationController
  def new
    @subject          = Subject.find(params[:subject_id])
    @subscribed_users = @subject.get_subscribed_users
    @invited_users    = @subject.get_invited_users
    @users            = User.all - (@subscribed_users + @invited_users)
  end

  def create
    @subscription            = Subscription.new
    @subscription.user_id    = params[:user_id]
    @subscription.subject_id = params[:subject_id]
    @subscription.status     = 'Pending Approval'

    if @subscription.save
      redirect_to :back, notice: 'User has been invited to subscribe to your topic.'
    else
      render :new
    end
  end

  def subscribe
    @subscription = Subscription.find_by(subject_id:params[:subject_id], user_id:params[:id])
    @subscription.status = 'Subscribed'
    @subscription.save

    redirect_to Subject.find(params[:subject_id]), notice: 'You successfully subscribed'
  end 

  def unsubscribe
    Subscription.find_by(subject_id:params[:subject_id], user_id:params[:id]).destroy
    redirect_to dashboard_path, notice: 'Successfully unsubscribed.' 
  end
end
