class SubredditsController < ApplicationController

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new
    @subreddit.name = params[:name]
    @subreddit.save
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end
end
