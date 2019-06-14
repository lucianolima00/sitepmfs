class AvaliationQuestionsController < ApplicationController
  before_action :set_avaliation_question, only: [:show, :edit, :update, :destroy]

  # GET /avaliation_questions
  # GET /avaliation_questions.json
  def index
    @avaliation_questions = AvaliationQuestion.all
  end

  # GET /avaliation_questions/1
  # GET /avaliation_questions/1.json
  def show
  end

  # GET /avaliation_questions/new
  def new
    @avaliation_question = AvaliationQuestion.new
  end

  # GET /avaliation_questions/1/edit
  def edit
    @avaliation = Avaliation.find(@avaliation_question.avaliation_id)
  end

  # POST /avaliation_questions
  # POST /avaliation_questions.json
  def create
    params["avaliation_questions"].each do |question|
      @avaliation_quesiton = AvaliationQuestion.new
      if question["Statement"] != "" || question["altA"] != "" || question["altB"] != "" || question["altC"] != "" || question["altD"] != "" || question["altE"] != ""
        @avaliation_question = AvaliationQuestion.create(avaliation_multi_questions_params(question))
      end
    end

    respond_to do |format|
      if @avaliation_question.save
        format.html { redirect_to avaliations_path, notice: 'Avaliation was successfully written.' }
        format.json { render :show, status: :created, location: avaliations_path }
      else
        format.html { render :new }
        format.json { render json: @avaliation_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliation_questions/1
  # PATCH/PUT /avaliation_questions/1.json
  def update
    respond_to do |format|
      if @avaliation_question.update(avaliation_question_params)
        format.html { redirect_to @avaliation_question, notice: 'Avaliation question was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliation_question }
      else
        format.html { render :edit }
        format.json { render json: @avaliation_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliation_questions/1
  # DELETE /avaliation_questions/1.json
  def destroy
    @avaliation_question.destroy
    respond_to do |format|
      format.html { redirect_to avaliation_questions_url, notice: 'Avaliation question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliation_question
      @avaliation_question = AvaliationQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliation_multi_questions_params(my_params)
      my_params.permit(:Statement, :altA, :altB, :altC, :altD, :altE, :avaliation_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliation_question_params
      params.require(:avaliation_question).permit(:Statement, :altA, :altB, :altC, :altD, :altE, :avaliation_id)
    end
end
