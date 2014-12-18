class VotesController < ApplicationController

  def create
    vote = current_user.votes.build(user_id: params[:user_id], 
                                    votable_id: params[:votable_id],  
                                    votable_type: params[:votable_type], 
                                    up: params[:up])
    vote.save
    redirect_to root_url
  end

  def destroy

  end
end
