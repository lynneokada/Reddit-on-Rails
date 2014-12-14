class RedditpostsController < ApplicationController

  def create
    @redditpost = current_user.redditposts.build(micropost_params)
    if @redditpost.save
      flash[:success] = "Redditpost created!"
      redirect_to root_url
    else
      #do some other stuff
    end
  end

  private

    def reddit_params
      params.require(:redditpost).permit(:content)
    end

end
