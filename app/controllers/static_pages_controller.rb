class StaticPagesController < ApplicationController
  def home
    return unless logger_in?

    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.page(params[:page]).per(Settings.record_per_page)
  end

  def help; end

  def about; end
end
