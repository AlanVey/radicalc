class AnswersController < ApplicationController

  def index
    @test    = Test.find(params[:test_id])
    @answers = Answer.where(test_id:params[:test_id])
  end

  def show
    @test   = Test.find(params[:test_id])
    @answer = Answer.where(user_id:current_user.id, test_id:params[:test_id])
    @answer = @answer.empty? ? Answer.new : @answer.first
  end

  def upload
    @answer         = Answer.new
    @answer.user    = current_user
    @answer.test_id = params[:test_id]
    @answer.status  = 'Submitted' 
    if @answer.save(answer_params)
      redirect_to :back, notice: 'Answer was successfully uploaded.'
    else
      render :show
    end
  end

  def reupload
    @answer         = Answer.find_by(user_id:current_user.id, test_id:params[:test_id])
    @answer.user    = current_user
    @answer.test_id = params[:test_id]
    @answer.status  = 'Submitted' 
    if @answer.update(answer_params)
      redirect_to :back, notice: 'Answer was successfully uploaded.'
    else
      render :show
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:value)
    end
end
