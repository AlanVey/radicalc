class QuestionController < ApplicationController

  def index
    @questions = Question.where(subject_id: params[:id], kind: params[:kind])
  end

  def show
    @uri = Question.find(params[:question_id]).uri
  end

  def new_general
    @question = Question.new
  end

  def new_technical
    @question = Question.new
  end

  def create_general
    @question = create_question('General')

    if @question.save
      redirect_to questions_path(kind: 'General'), 
        notice: 'General question successfully created'
    else
      render :new_general, 
        notice: 'An error occured saving your question'
    end
  end

  def create_technical
    @question = create_question('Technical')

    if @question.save
      redirect_to questions_path(kind: 'Technical'), 
        notice: 'Technical question successfully created'
    else
      render :new_technical, 
        notice: 'An error occured saving your question'
    end
  end

  private

    def create_question(kind)
      quaestio = Quaestio.new
      question = Question.new

      if quaestio.newDebate(params[:question][:title])
        question.title      = params[:question][:title]
        question.user       = current_user
        question.subject_id = params[:id]
        question.debate_id  = quaestio.debate_id
        question.uri        = quaestio.uri
        question.kind       = kind 
      end

      question    
    end

end
