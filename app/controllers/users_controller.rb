class UsersController < ApplicationController
  def index
    @users = User.starts_with(params[:term])
    respond_to do |f|
      f.json {render :json => @users.map{|u| {:value => u.id, :label => u.username}}}
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "User updated"
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in(@user)
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
