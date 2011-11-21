class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      back_to = session[:back_to] || root_url
      reset_session
      session[:user_id] = user.id

      redirect_to back_to, :notice => "Logged in!"
    else
      flash.now.notice = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    reset_session
    
    redirect_to root_url, :notice => "Logged out!"
  end
end
