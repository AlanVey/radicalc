class QuestionController < ApplicationController
  before_action :set_kind
  before_action :set_subject
  before_action :check_observer

  def index
    @questions = Question.where(subject_id: params[:id], kind: params[:kind])
    @question = Question.new
  end

  def show
    @uri = Question.find(params[:question_id]).uri
    @question = Question.find(params[:question_id])
  end

  def create
    @question = create_question(@kind, current_user.profile.first_name, current_user.profile.last_name)

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

    def create_question(kind, firstname, lastname)
      quaestio = Quaestio.new
      question = Question.new

      if quaestio.newDebate(params[:question][:title], firstname, lastname)
        question.title      = params[:question][:title]
        question.user       = current_user
        question.subject_id = params[:id]
        question.debate_id  = quaestio.debate_id
        question.uri        = quaestio.uri
        question.kind       = kind 
      end

      question    
    end

    def set_subject
      @subject   = Subject.find(params[:id])
    end
end
