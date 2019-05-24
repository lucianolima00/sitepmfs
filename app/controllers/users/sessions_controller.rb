#frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  after_action :configure_account_params, only: [:create]

  #GET /resource/sign_in
  def new
    super    
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  #def destroy
  #  super
  #end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  def configure_account_params
    if current_user.role_id == 1
      if current_user.birth == nil || current_user.subjects == nil || Student.find(Student.where("user_id=#{current_user.id}").ids.first).schoolroom_id == nil
        redirect_to account_new_path(:id => current_user.id)
      end
    else 
      if current_user.birth == nil || current_user.subjects == nil
        redirect_to account_new_path(:id => current_user.id)
      end
    end
  end
end
