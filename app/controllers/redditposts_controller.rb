class RedditpostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]

  def create
    @redditpost = current_user.redditposts.build(redditpost_params)
    if @redditpost.save
      flash[:success] = "Redditpost created!"
      redirect_to root_url
    else
      #do some other stuff
      @feed_items = []
    end
  end

  def destroy

  end

  private

    def redditpost_params
      params.require(:redditpost).permit(:content)
    end

    def correct_user
      @redditpost = current_user.redditposts.find_by(:id params[:id])
      redirect_to root_url if @redditpost.nil
    end

end
