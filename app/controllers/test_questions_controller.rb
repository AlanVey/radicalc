class TestQuestionsController < ApplicationController

  def show
    @test_question  = TestQuestion.find(params[:question_id])
    quaestio        = Quaestio.new
    debate_id       = Question.find_by(subject_id: params[:id], 
                                       kind: 'Test Question', 
                                       title: @test_question.title).debate_id

    quaestio.modifyDebate(debate_id, current_user.profile.first_name, current_user.profile.last_name)

    @uri = quaestio.uri
  end

  def create
    @test_question         = TestQuestion.new(test_question_params)
    @test_question.user    = current_user
    @test_question.test_id = params[:test_id]
    @test_question.kind    = TestQuestion.kinds[0]
    @test_question.status  = 'Open'

    @question = create_question(@test_question.title, params[:id], 'Test Question')

    if @test_question.save and @question.save
      redirect_to :back, 
        notice: 'Test question was successfully created.'
    else
      redirect_to :back, 
        notice: 'An error occured'
    end
  end

  def destroy
    TestQuestion.find(params[:question_id]).destroy
    redirect_to show_test_path, 
      notice: 'Test question was successfully destroyed.'
  end

  private
    def test_question_params
      params.require(:test_question).permit(:title, :kind, :answer)
    end

    def create_question(title, subject_id, kind)
      quaestio = Quaestio.new
      question = Question.new

      if quaestio.newDebate(title, current_user.profile.first_name, current_user.profile.last_name)
        question.title      = title
        question.user       = current_user
        question.subject_id = subject_id
        question.debate_id  = quaestio.debate_id
        question.uri        = quaestio.uri
        question.kind       = kind 
      end

      question    
    end
end
