class AccountController < ApplicationController
  before_action :set_user_info
  def index
  end

  def new
  end

  def show
  end

  def update
  end

  protected

  def set_user_info
    @user = User.find(params[:id])
  end
end
