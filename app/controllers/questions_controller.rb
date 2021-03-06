class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    @questionnaire = Questionnaire.find(@question.questionnaire_id)
  end

  # POST /questions
  # POST /questions.json
  def create
    #@question = Question.new(question_params)

    params["questions"].each do |question|
      if question["textStatement"] != "" || question["alternatives"] != "" || question["altA"] != "" || question["altB"] != "" || question["altC"] != "" || question["altD"] != "" || question["altE"] != "" || question["correctAlt"] != "" 
        @question = Question.create(questions_params(question))
      end
    end

    @questionnaire = Questionnaire.find(params["questions"][0]["questionnaire_id"])

    respond_to do |format|
      if @question.save
        format.html { redirect_to @questionnaire, notice: 'Questions was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @questionnaire = Questionnaire.find(@question.questionnaire_id)
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @questionnaire, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questions_params(my_params)
      my_params.permit(:textStatement, :picStatement, :altA, :altB, :altC, :altD, :altE, :correctAlt, :questionnaire_id, :alternatives) 
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:textStatement, :picStatement, :altA, :altB, :altC, :altD, :altE, :correctAlt, :questionnaire_id) 
    end
end
