class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @tweet = current_user.tweets.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end
