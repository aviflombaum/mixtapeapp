class SharesController < ApplicationController
  
  def new
    if request.xhr?    
      render :layout => false
    end
  end
  
  def create
    @mixtape = Mixtape.find params[:mixtape_id]
    @user = User.find_by_email params[:user_email]
  
    @mixtape.add_user(@user, params[:permission])
    
    respond_to do |format|
      format.html {redirect_to @mixtape, :notice => "Shared with #{@user.email}"}
      format.js 
    end
  end

end