class AvaliationsController < ApplicationController
  before_action :set_avaliation, only: [:show, :edit, :update, :destroy, :write]

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
    @answer = Answer.new
    @array = []
    unless @avaliation.model
      @teacher = Teacher.find(@avaliation.teacher_id)
      @subject = Subject.find(@avaliation.subject_id)
    end
    AvaliationQuestion.where("avaliation_id='#{Avaliation.find_by(model: true).id}'").each do |q|
    @array << q
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
        format.html { redirect_to @avaliation, notice: 'Avaliation was successfully created.' }
        format.json { render :show, status: :created, location: @avaliation }
      else
        format.html { render :new }
        format.json { render json: @avaliation.errors, status: :unprocessable_entity }
      end
    end
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
end
