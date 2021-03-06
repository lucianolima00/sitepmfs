class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index]

    def index
      @subjects = Subject.all
    end

    def new
      @subject = Subject.new
    end

    def create
      @subject = Subject.new(subject_params)
      respond_to do |format|
        if @subject.save
          format.html { redirect_to subjects_url, notice: 'Subject was successfully created.' }
          format.json { render :show, status: :created, location: @subject }
        else
          format.html { render :new }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      if @subject.teacher_id != params["subject"]["teacher_id"]
        @from = User.find(Teacher.find(@subject.teacher_id).user_id)
        @from.subjects.delete(@subject.id)
        @from.save
        @to = User.find(Teacher.find(params["subject"]["teacher_id"]).user_id)
        @to.subjects << @subject.id
        @to.save
      end
      respond_to do |format|
        if @subject.update(subject_params)
          format.html { redirect_to subjects_url, notice: 'Subject was successfully updated.' }
          format.json { render :show, status: :created, location: @subject }
        else
          format.html { render :new }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @subject.destroy
      respond_to do |format|
        format.html { redirect_to subjects_url, notice: 'Subject was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end
    def subject_params
        params.require(:subject).permit(:subjectName, :teacher_id)
    end
end
