class VotesController < ApplicationController

  def create

  end

  def destroy

  end


  def post 

  end	

  private

  def votable_params(params_object = params[:voteType])
    params_object.permit(:votable_id, :votable_type, :user_id)
  end

end