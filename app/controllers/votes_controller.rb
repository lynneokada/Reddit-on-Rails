class VotesController < ApplicationController

  def create
    @vote = Vote.new
  end

  def destroy

  end

  private

    def current_redditpost
      Redditpost.find(params[:id])
    end
end
