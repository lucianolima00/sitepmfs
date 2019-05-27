class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :answer, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :num_question, only: [:show, :edit, :update, :write]
  before_action :alts, only: [:show, :write]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all.order(created_at: :desc)
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])
    @answer = Answer.new
    @array = []
    Question.where("Questionnaire_id='#{params[:id]}'").each do |q|
      @array << q
    end
    while @array.length < @questionnaire.noQuestion do
      q = Question.new
      @array << q
    end
  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(params.permit(:subject_id, :noQuestion))

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :new }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # GET /questionnaires/1/write
  def write
    @questionnaire = Questionnaire.find(params[:id])
    @questions = Question.where("Questionnaire_id='#{params[:id]}'")
    @questions.each do |q| 
      q.destroy
    end
    @array = []
    @questionnaire.noQuestion.times do |index|
      @question = Question.new
      @i = index
      @question.num = @i
      @question.num = index
      @array << @question
    end
  end

  #POST /questionnaires/1/answers
  def answer
    @answer = Answer.new(answer_params)
    @questionnaire = Questionnaire.find(params[:id])
    @question = Question.find_by(questionnaire_id: @questionnaire.id)
    @alt = params[:answers]
    @grade = 0
    @avg = 100 / @questionnaire.noQuestion 
    @questionnaire.noQuestion do |a|
      if @alt[a] == @question[a].correctAlt
        @grade = @grade + 1
      end
    end 
    @answer.student_id = params[:student_id]
    @answer.questionnaire_id = params[:id]
    @answer.grade = @grade * @avg

    if @answer.save
      format.html { redirect_to questionnaire_show_path(@questionnaire), notice: 'Questionnaire was successfully answered.' }
      format.json { render :show, status: :ok, location: @questionnaire }
    end
    
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(:subject_id, :noQuestion)
    end

    def answer_params
      params.require(:answer).permit(:answers, :student_id, :questionnaire_id)
    end

    def num_question
      @questionnaire = Questionnaire.find(params[:id])
      @numQuestion = []
      @questionnaire.noQuestion.times do |i|
        @numQuestion << i + 1
      end
    end

    def alts
      @alt = ["A", "B", "C", "D", "E"]
    end
end
