class SubredditsController < ApplicationController

  def create
    @subreddit = Subreddit.new
    @subreddit.name = params[:name]
    @subreddit.save
  end
end
