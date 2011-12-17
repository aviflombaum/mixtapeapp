class SharesController < ApplicationController
  
  def new
    @mixtape = Mixtape.find(params[:mixtape_id])
    render :layout => false if request.xhr?
  end
  
  def create
    @mixtape = Mixtape.find(params[:mixtape_id])
    @user = User.find(params[:user_id])
    @mixtape.add_user(@user, :listener)
    respond_to do |f|
      f.html {redirect_to mixtape_url(@mixtape), :notice => "Shared mixtape with #{@user.username}"}
      f.js 
    end
  end
end
