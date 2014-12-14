class SessionsController < ApplicationController

  # new is not included because the login form is on the home page.

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      # user.remember
      redirect_to root_url
    else
      # show login error using flash
      message  = "Account not activated. "
      #message += "Check your email for the activation link."
      flash[:warning] = message
      redirect_to root_url
    end
  end

  def destroy

  end
end
