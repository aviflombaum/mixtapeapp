class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash
      user = Identity.find_user_by_auth_hash(auth_hash)
      if user
        create_user_session(user)
      else
        user = User.create_from_auth_hash(auth_hash)
        create_user_session(user, :redirect => edit_user_path(user))
      end
    else
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        create_user_session(user)
      else
        flash.now.notice = "Invalid email or password"
        render "new"
      end
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
