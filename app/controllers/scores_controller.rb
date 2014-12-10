class ScoresController < ApplicationController
  before_action :set_score, only: [:edit, :update]
  before_action :set_test
  before_action :set_answer, only: [:create, :new]


  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    @score         = Score.new(score_params)
    @score.test_id = @test.id
    @score.user    = @answer.user
    respond_to do |format|
      if @score.save
        format.html { redirect_to answers_path(test_id: @test.id), notice: 'Score was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update
    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to answers_path(test_id: @test.id), notice: 'Score was successfully updated.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    def set_test
      @test = Test.find(params[:test_id])
    end

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:value)
    end
end
