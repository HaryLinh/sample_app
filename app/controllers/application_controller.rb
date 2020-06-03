class ApplicationController < ActionController::Base
  include SesssionsHelper
  before_action :set_locale
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def logged_in_user
    return if logger_in?

    store_location
    flash[:danger] = t "flash.login"
    redirect_to login_url
  end
end
