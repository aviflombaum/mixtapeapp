class SharesController < ApplicationController
  
  def new
    @mixtape = Mixtape.find(params[:mixtape_id])
  end
  
  def create
    @mixtape = Mixtape.find(params[:mixtape_id])
    @user = User.find(params[:user_id])
    @mixtape.add_user(@user, :listener)
    redirect_to mixtape_url(@mixtape), :notice => "Shared mixtape with #{@user.username}"
  end
end
