class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy, :avaliable]
  before_action :authenticate_user!, except: [:index]
  before_action :num_question, only: [:show, :edit, :update, :write]
  before_action :alts, only: [:show, :write]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaire = Questionnaire.all.first
    @questionnaires = Questionnaire.all.order(created_at: :desc)
    @avaliations = Avaliation.all.order(created_at: :desc)
    @newquestionnaire = Questionnaire.new
    @answer_questionnaire = 0
    if current_user.role_id == 1
      current_user.subjects.each do |subject|
        if Questionnaire.find_by(subject_id: subject).avaliable
          @answer_questionnaire = @answer_questionnaire + 1
        end
      end
    end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])
    if current_user.role_id == 1
      @student = Student.find_by user_id: current_user.id
    end
    @answer = []
    @allQuestion = []
    current_user.subjects.each do |subject|
      Question.where(questionnaire_id: Questionnaire.find_by(subject_id: subject)).order(questionnaire_id: :asc).each do |question|
        @allQuestion << question
      end
    end
    @allQuestion.count.times do
      @answer << Answer.new
    end
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

  # GET /questionnaires/1/avaliable
  def avaliable
    @questionnaire.avaliable = TRUE
    if @questionnaire.save
      redirect_to questionnaires_url
    end 
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new
    @questionnaire.noQuestion = params["questionnaire"]["noQuestion"]
    @questionnaire.subject_id = params["questionnaire"]["subject_id"]
    @questionnaire.user_id = User.find(Teacher.find(Subject.find(params["questionnaire"]["subject_id"]).teacher_id).user_id)

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire }
      else
        format.html { render :index }
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

  #POST /questionnaires/1/
  def answer
    @questionnaire = []
    params['answer'].each do |answer|
      @questionnaire << answer["questionnaire_id"]
    end
    @questionnaire.uniq.each do |questionnaire|
      @alt = []
      params['answer'].each do |answer|
        if answer['questionnaire_id'] == questionnaire
          @alt << answer['answers']
        end
      end
      @questionnaire = Questionnaire.find(questionnaire.to_i)
      @question = Question.where("questionnaire_id='#{questionnaire.to_i}'")
      @answer = Answer.find_or_create_by(student_id: params['answer'][0]['student_id'], questionnaire_id: questionnaire.to_i)
      @grade = 0
      @avg = 100 / @questionnaire.noQuestion 
      @questionnaire.noQuestion.times do |a|
        if @alt[a] == @question[a].correctAlt
          @grade = @grade + 1
        end
      end 
      @answer.answers = @alt
      @answer.student_id = params[:student_id]
      @answer.questionnaire_id = questionnaire.to_i
      @answer.save
      @grades = Grade.new
      @grades.grade = @grade * @avg
      @grades.student_id = params[:student_id]
      @grades.questionnaire_id = questionnaire.to_i
      @grades.subject_id = @questionnaire.subject_id
      @grades.schoolroom_id = Student.find(params[:student_id]).schoolroom_id
      @grades.save
    end

    redirect_to questionnaires_url, notice: 'Questionnaire was successfully answered.'
    
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
