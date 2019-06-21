class AccountController < ApplicationController
  before_action :set_user_info
  def index
    missings_params
  end

  def new

  end

  def create
    unless @user.subjects.include?(params["subjects"]) && params["subjects"] == nil
      @user.subjects << params["subjects"]
    end
    if @user.role_id == 1
      if @student.update(student_params) && @user.update(user_params)
        redirect_to account_path(:id => @user.id)
      end
    else
      if @user.update(user_params)
        redirect_to account_path(:id => @user.id)
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.role_id == 1
      if@student.update(student_params) && @user.update(user_params)
        redirect_to account_path(:id => @user.id)
      end
    elsif @user.update(user_params)
      redirect_to account_path(:id => @user.id)
    end
  end

  protected

  def set_user_info
    @user = User.find(params[:id])
    if @user.role_id == 1
      @student = Student.find(Student.where("user_id=#{@user.id}").ids.first)
    else 
      @teacher = Teacher.find(Teacher.where("user_id=#{@user.id}").ids.first)
    end
  end

  def user_params
    params.require(:user).permit(:subjects, :birth, :avatar)
  end

  def student_params
    params.require(:student).permit(:schoolroom_id)
  end

  def missings_params
    if @user.role_id == 1
      @student = Student.find_by(user_id: @user.id)
      if @user.birth == nil || @user.avatar == nil || @student.schoolroom_id == nil
        redirect_to account_new_path
      end
    else
      if @user.birth == nil || @user.avatar == nil || @user.subjects == nil
        redirect_to account_new_path
      end
    end
  end
end
