class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_action :check_observer, only: [:show, :edit, :update, :destroy]

  def show
    @subscribed_users = @subject.get_subscribed_users
  end

  def new
    @subject = Subject.new(parent_id: params[:parent_id])
  end

  def edit
  end

  def create
    if params[:subject][:parent_id].to_i > 0
      parent = Subject.find_by_id(params[:subject].delete(:parent_id))
      @subject = parent.children.build(subject_params)
    else
      @subject = Subject.new(subject_params)
    end

    @subject.user = current_user

    if @subject.save
      current_user.add_role :admin, @subject

      if @subject.parent != nil
        #add all admins and members from parent node
        for user in User.with_role(:admin, @subject.parent) do
          user.add_role :admin, @subject
        end
        for user in User.with_role(:member, @subject.parent) do
          user.add_role :member, @subject
        end
      end

      Subscription.create(user_id:current_user.id, subject_id:@subject.id, privilege: 'admin', status:'Subscribed')
      redirect_to @subject, notice: 'Subject was successfully created.'
    else
      render :new
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to @subject, notice: "Subject: #{@subject.name} was successfully updated." 
    else
      render :edit 
    end
  end

  def destroy
    @subject.destroy
    redirect_to dashboard_path, notice: "Subject: #{@subject.name} was successfully destroyed." 
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :body, :parent_id, :debate_type)
    end


end
