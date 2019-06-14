class AccountController < ApplicationController
  before_action :set_user_info
  def index
    missings_params
  end

  def new

  end

  def create
    if @user.role_id == 1
      if @student.update(student_params) && @user.update(user_params)
        redirect_to account_path(:id => @user.id)
      end
    elsif @user.update(user_params)
      redirect_to account_path(:id => @user.id)
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
      @student = Student.find(Student.where("user_id=#{@user.id}").ids.first)
      if @student.schoolroom_id == nil
        redirect_to account_new_path
      end
    end

    if @user.birth == nil || @user.avatar || @user.subjects == nil
      redirect_to account_new_path
    end
  end
end
