class VotesController < ApplicationController

  def create
<<<<<<< HEAD

=======
    
>>>>>>> 51e518b58fe1206269a97252ec586bc6aabccb7e
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
