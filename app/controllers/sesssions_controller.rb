class SesssionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash[:warning] = t "new_session.active"
        redirect_to root_url
      end
    else
      flash[:danger] = t "new_session.danger"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def forget user
    user.forget
    cookies.delete :user_id
    cookies.delete :remember_token
  end
end
