class HomeController < ApplicationController
  def home
    @user = User.new
    @redditpost = current_user.redditposts.build if logged_in?
    @redditposts = Redditpost.all
  end
end
