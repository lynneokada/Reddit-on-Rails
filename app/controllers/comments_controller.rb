class CommentsController < ApplicationController

  def new
    comment = current_redditpost.comments.build(user_id: current_user.id, body: params[:comment][:content])
    comment.save
    redirect_to current_redditpost
  end

  def destroy
    # delete comment
  end

  private

    def current_redditpost 
      Redditpost.find(params[:id])
    end

end
