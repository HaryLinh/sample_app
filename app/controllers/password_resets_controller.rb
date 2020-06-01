class PasswordResetsController < ApplicationController
  before_action :load_user, :valid_user, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t "password_reset.send_email"
      redirect_to root_url
    else
      flash.now[:danger] = t "password_reset.invalid_email"
      render :new
    end
  end

  def edit; end

  def update
    if user_params[:password].empty?
      flash[:danger] = t "mailer.password_error"
      render :edit
    elsif @user.update_attributes user_params
      log_in @user
      flash[:success] = t "mailer.successful_reset"
      redirect_to @user
    else
      flash[:danger] = t "mailer.password_failed"
      render :edit
    end
  end

  private

  def load_user
    @user = User.find_by email: params[:email]
    return if @user

    flash[:error] = t "flash.fail_find_user"
    redirect_to root_url
  end

  def valid_user
    return if @user.activated? && @user.authenticated?(:reset, params[:id])

    flash[:error] = t "password_reset.account_active_fail"
    redirect_to root_url
  end

  def user_params
    params.require(:user).permit User::PASSWORD_PARAMS
  end
end
