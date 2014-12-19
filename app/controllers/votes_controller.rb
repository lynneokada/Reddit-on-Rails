class VotesController < ApplicationController
  include ApplicationHelper

  def create
    @vote = current_user.votes.build(user_id: params[:user_id],
                                    votable_id: params[:votable_id],
                                    votable_type: params[:votable_type],
                                    up: params[:up])

    @vote.save
    if @vote.votable_type = :redditpost
      @votable = Redditpost.find(@vote.votable_id)
      @votable.update_score
    else
      @votable = Comment.find(@vote.votable_id)
      @votable.update_score
    end
    if !@votable
      raise "redditpost or comment cannot be nil"
    end
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def destroy
    # vote = Vote.find(params[:id]).votable_type
    # current_user.unvote(vote)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end
end
