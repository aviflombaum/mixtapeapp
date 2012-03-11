class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      create_user_session(user)
    else
      flash.now.notice = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    reset_session
    
    redirect_to root_url, :notice => "Logged out!"
  end

  private    
    def create_user_session(user, opts = {})
      back_to = session[:back_to] || opts[:redirect] || root_url
      log_in(user)
      redirect_to back_to, :notice => "Logged in!"
    end
end
