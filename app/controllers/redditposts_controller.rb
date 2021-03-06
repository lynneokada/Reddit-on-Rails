class RedditpostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]

  def create
    @redditpost = current_user.redditposts.build(redditpost_params)
    @redditpost.score = 0
    if @redditpost.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      flash[:warning] = "Invalid inputs."
      @feed_items = []
      redirect_to root_url
    end
  end

  def destroy
    @redditpost = Redditpost.find(params[:id])
    @redditpost.destroy
    flash[:success] = "Redditpost deleted!"
    redirect_to request.referrer || root_url
  end

  def show
    @redditpost = Redditpost.find(params[:id])
    @comments = @redditpost.comments
  end

  def add_comment

  end

  private

    def redditpost_params
      params.require(:redditpost).permit(:content, :title)
    end

    def correct_user
      @redditpost = current_user.redditposts.find_by(id: params[:id])
      redirect_to root_url if @redditpost.nil
    end
end
