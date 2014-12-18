class HomeController < ApplicationController
  def home
    @user = current_user || User.new
    @redditpost = current_user.redditposts.build if logged_in?
    @redditposts = Redditpost.order(sorting_score: :DESC)
  end
end
