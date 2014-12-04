class TestController < ApplicationController

  before_action :set_subject
  before_action :check_observer

  def index
    @subject = Subject.find(params[:id])
    @tests   = Test.where(subject_id: params[:id])
  end

  def new
    @test = Test.new
  end

  def show
    @test      = Test.find(params[:test_id])
    @questions = TestQuestion.where(test_id: @test.id)
  end

  def create
    @test            = Test.new(test_params)
    @test.user       = current_user
    @test.subject_id = params[:id]

    if @test.save
      redirect_to show_test_path(test_id: @test.id), notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  private
    def test_params
      params.require(:test).permit(:title, :kind)
    end

    def set_subject
      @subject = Subject.find(params[:id])
    end

end
