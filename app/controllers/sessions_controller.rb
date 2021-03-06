class SessionsController < ApplicationController

  # new is not included because the login form is on the home page.

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url
    else
      # show login error using flash
      # message  = "Account not activated. "
      # message += "Check your email for the activation link."
      # flash[:warning] = message
      flash[:warning] = "please try again."
      redirect_to root_url
    end
  end

  def destroy
    log_out(current_user) if logged_in?
    redirect_to root_url
  end
end
