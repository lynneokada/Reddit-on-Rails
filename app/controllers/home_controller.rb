class HomeController < ApplicationController
  def home
    # @redditpost = current_user.redditposts.build if logged_in?
    @redditposts = Redditpost.order(sorting_score: :DESC)
    @subreddit = Subreddit.new
  end
end
