class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new,:create]
  before_action :load_user, only: [:show, :update, :edit, :destroy]
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.page(params[:page]).per(Settings.record_per_page)
  end

  def new
    @user = User.new
  end

  def show
    @microposts = @user.microposts.page(params[:page]).per(Settings.record_per_page)
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t "flash.title"
      redirect_to root_url
    else
      flash[:success] = t "flash.fail"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "flash.title"
      redirect_to @user
    else
      flash.now[:danger] = t "flash.fail"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "flash.ok"
    else
      flash[:danger] = t "flash.delete_faill"
    end
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def correct_user
    return if current_user? @user
    redirect_to root_url
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:error] = t "flash.fail_find_user"
    redirect_to root_url
  end

   def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
