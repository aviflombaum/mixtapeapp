class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    def login_required
      unless logged_in?
        session[:back_to] = request.url
        redirect_to(login_path, :notice => "You must login to access that page.")
      end
    end
    
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
    
    def logged_in?
      !!current_user
    end
    helper_method :logged_in?
    
    def log_in(user)
      reset_session
      session[:user_id] = user.id
    end
    
    def current_user_can?(action, object)
      if !current_user.send("can_#{action}?", object)
        redirect_to root_url, :notice => "You are not authorized to #{action} #{object.name}"
      end
    end    
end
