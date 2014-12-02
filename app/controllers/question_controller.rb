class QuestionController < ApplicationController
  before_action :set_kind

  def index
    @subject   = Subject.find(params[:id])
    @questions = Question.where(subject_id: params[:id], kind: params[:kind])
  end

  def show
    @uri = Question.find(params[:question_id]).uri
  end

  def new
    @question = Question.new
  end

  def create
    @question = create_question(@kind)

    if @question.save
      redirect_to questions_path(kind: @kind), 
        notice: "#{@kind} question successfully created"
    else
      render :new, 
        notice: 'An error occured saving your question'
    end
  end

  private

    def set_kind
      @kind = params[:kind]
    end

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
