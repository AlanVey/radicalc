class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  # GET /subjects/1
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new(parent_id: params[:parent_id])
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  def create
    if params[:subject][:parent_id].to_i > 0
      parent = Subject.find_by_id(params[:subject].delete(:parent_id))
      @subject = parent.children.build(subject_params)
    else
      @subject = Subject.new(subject_params)
    end

    @subject.author = current_user
    current_user.add_role :admin, @subject

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, 
                      notice: 'Subject was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /subjects/1
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, 
               notice: "Subject: #{@subject.name} was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, 
                    notice: "Subject: #{@subject.name} was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name, :body, :parent_id, :debate_type)
    end
end
