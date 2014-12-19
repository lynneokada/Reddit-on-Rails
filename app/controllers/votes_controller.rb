class VotesController < ApplicationController

  def create
    vote = current_user.votes.build(user_id: params[:user_id],
                                    votable_id: params[:votable_id],
                                    votable_type: params[:votable_type],
                                    up: params[:up])
    vote.score++
    vote.save
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
