class SolutionsController < ApplicationController

  def show
    @test   = Test.find(params[:test_id])
    @solution = Solution.where(user_id:current_user.id, test_id:params[:test_id])
    @solution = @solution.empty? ? Solution.new : @solution.first
    @subject = Subject.where(id:@test.subject_id)
  end

  def upload
    @test   = Test.find(params[:test_id])
    @solution         = Solution.new(solution_params)
    @solution.user    = current_user
    @solution.test_id = params[:test_id]
    if @solution.save
      redirect_to :back, notice: 'Solution was successfully uploaded.'
    else
      render :show
    end
  end

  def reupload
    @solution         = Solution.find_by(user_id:current_user.id, test_id:params[:test_id])
    @solution.user    = current_user
    @solution.test_id = params[:test_id]
    if @solution.update(solution_params)
      redirect_to :back, notice: 'Solution was successfully uploaded.'
    else
      render :show
    end
  end

  private
  def solution_params
    params.require(:solution).permit(:value)
  end
  
end
