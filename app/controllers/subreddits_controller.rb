class SubredditsController < ApplicationController

  def new
    @subreddit = Subreddit.new
  end

  def create
    @subreddit = Subreddit.new(subreddit_params)
    if @subreddit.save
      flash[:success] = "Subreddit created!"
      subreddit_path = "/subreddits/#{ @subreddit.id }"
      redirect_to subreddit_path
    else
      flash[:warning] = "Invalid inputs? idk what the shit"
      redirect_to '/subreddits/new'
    end
  end

  def show
    @subreddit = Subreddit.find(params[:id])
  end

  private
    def current_subreddit
      Subreddit.find(params[:id])
    end

    def subreddit_params
      params.require(:subreddit).permit(:name)
    end
end
