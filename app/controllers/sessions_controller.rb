class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase )
    if user && user.authenticate(session_params[:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash[:danger] = "Invalid email/password"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def session_params
    params[:session]
  end
end
