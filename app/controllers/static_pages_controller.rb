class StaticPagesController < ApplicationController
  def home
    if logger_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page]).per(Settings.record_per_page)
    end
  end

  def help; end

  def about; end
end
