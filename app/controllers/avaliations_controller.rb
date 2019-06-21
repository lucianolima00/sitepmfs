class AvaliationsController < ApplicationController
  before_action :set_avaliation, only: [:show, :edit, :update, :destroy, :write, :questions]
  before_action :alts, only: [:show]

  # GET /avaliations
  # GET /avaliations.json
  def index
    @avaliations = Avaliation.all
  end  

  # GET /avaliation/1
  # GET /avaliation/1.json
  def show
    if current_user.role_id == 1
      @student = Student.find_by user_id: current_user.id
    end
    @answer = []
    @array = []
    unless @avaliation.model
      @teacher = Teacher.find(@avaliation.teacher_id)
      @subject = Subject.find(@avaliation.subject_id)
    end
    AvaliationQuestion.where("avaliation_id='#{@avaliation.id}'").each do |q|
      @array << q
      @answer << AnswerAvaliation.new
    end
  end

  # GET /avaliations/new
  def new
    @avaliation = Avaliation.new
  end
  
  # get /avaliations/new/model
  def model
    if Avaliation.find_by(model: true)
      Avaliation.find_by(model: true).destroy
    end
    @avaliation = Avaliation.new
    @avaliation.model = true
    @avaliation.save
    @array = []
    @array << AvaliationQuestion.new
    #@questionnaire.noQuestion.times do |index|
    #  @question = AvaliationQuestion.new
    #  @i = index
    #  @question.num = @i
    #  @question.num = index
    #  @array << @question
    #end
  end

  # GET /avaliations/1/edit
  def edit
  end

  # POST /avaliations
  # POST /avaliations.json
  def create
    @avaliation = Avaliation.new(params.permit(:teacher_id, :model, :subject_id))
    @avaliation.model = false 

    respond_to do |format|
      if @avaliation.save
        @questions = AvaliationQuestion.where("avaliation_id='#{Avaliation.find_by(model: TRUE).id}'")
        @questions.each do |question|
          @nwquestion = AvaliationQuestion.new
          @nwquestion.Statement = question.Statement
          @nwquestion.altA = question.altA
          @nwquestion.altB = question.altB
          @nwquestion.altC = question.altC
          @nwquestion.altD = question.altD
          @nwquestion.altE = question.altE
          @nwquestion.avaliation_id = @avaliation.id
          @nwquestion.save
        end
        format.html { redirect_to @avaliation, notice: 'Avaliation was successfully created.' }
        format.json { render :show, status: :created, location: @avaliation }
      else
        format.html { render :new }
        format.json { render json: @avaliation.errors, status: :unprocessable_entity }
      end
    end
  end

  #POST /avaliations/1/
  def answer
    @avaliation = Avaliation.find(params['answer_avaliation'][0]['avaliation_id'])
    @answer = AnswerAvaliation.find_or_create_by(student_id: params['answer_avaliation'][0]['student_id'], avaliation_id: @avaliation.id)

    @alt = []
    params['answer_avaliation'].each do |answer|
      @alt << answer['answers']
    end

    @answer.answers = @alt
    @answer.student_id = params[:student_id]
    @answer.avaliation_id = @avaliation.id
    @answer.comment = params['answer_avaliation'].last['comment']

    if @answer.save
      redirect_to questionnaires_url, notice: 'Avaliation was successfully answered.'
    end
    
  end

  def questions
    @questions = AvaliationQuestion.where("avaliation_id='#{Avaliation.find_by(model: TRUE).id}'")
    @nwquestion = AvaliationQuestion.where("avaliation_id='#{@avaliation.id}'")
    @nwquestion.delete_all
    @questions.each do |question|
      @nwquestion = AvaliationQuestion.new
      @nwquestion.Statement = question.Statement
      @nwquestion.altA = question.altA
      @nwquestion.altB = question.altB
      @nwquestion.altC = question.altC
      @nwquestion.altD = question.altD
      @nwquestion.altE = question.altE
      @nwquestion.avaliation_id = @avaliation.id
      @nwquestion.save
    end
    redirect_to @avaliation
  end


  # PATCH/PUT /avaliations/1
  # PATCH/PUT /avaliations/1.json
  def update
    respond_to do |format|
      if @avaliation.update(avaliation_params)
        format.html { redirect_to @avaliation, notice: 'Avaliation was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliation }
      else
        format.html { render :edit }
        format.json { render json: @avaliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliations/1
  # DELETE /avaliations/1.json
  def destroy
    @avaliation.destroy
    respond_to do |format|
      format.html { redirect_to avaliations_url, notice: 'Avaliation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliation
      @avaliation = Avaliation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliation_params
      params.require(:avaliation).permit(:teacher_id, :model, :subject_id)
    end

    def alts
      @alt = ["A", "B", "C", "D", "E"]
    end
end
