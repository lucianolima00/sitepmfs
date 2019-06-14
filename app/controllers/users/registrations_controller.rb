#frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :account_params, only: [:account_update]
  before_action :set_user, only: [:set_teacher, :set_student, :set_admin]
  skip_before_action :verify_authenticity_token, only: [:account_update]  

  def index
    @users = User.all.order(:id)
  end

  # GET /resource/sign_up
  #def new
  #  super
  #end

  # POST /resource
  def create
    super
    case resource.role_id
    when 1
      Student.create("user_id" => resource.id)
    when 2
      Teacher.create("user_id" => resource.id)
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  def set_teacher
    Student.destroy(Student.find_by(user_id: params[:id]).id)
    Teacher.new
    Teacher.create("user_id" => params[:id])
    @user.role_id = 2
    
    if @user.save
      redirect_to account_show_path(:id => @user.id)
    end
  end

  def set_student
    Teacher.destroy(Teacher.find_by(user_id: params[:id]).id)
    Student.new
    Student.create("user_id" => params[:id])
    @user.role_id = 1
    
    if @user.save
      redirect_to account_show_path(:id => @user.id)
    end
  end

  def set_admin
    @user = User.find(params[:id])
    if @user.admin
      @user.admin = false
    else
      @user.admin = true
    end

    if @user.save
      redirect_to account_show_path(:id => @user.id)
    end
  end

  # DELETE /resource
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute, :regNumber, :firstName, :lastName])
   end

  # If you have extra params to permit, append them to the sanitizer.
  #def configure_account_update_params
  #  devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  #end

  def set_user
    @user = User.find(params[:id])
  end

  def account_params
    params.require(:user).permit(:firstName, :lastName, :role_id, :regNumber, :avatar)
  end
  
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    account_new_path(current_user.id)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
