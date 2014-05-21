class SessionsController < ApplicationController

  def create
    username = params[:user][:username]
    password = params[:user][:password]

    @user = User.find_by_credentials(username, password)

    if @user
      flash[:notices] = ["Welcome, #{@user.username}!"]
      login!(@user)
      redirect_to root_url
    else
      flash[:errors] = ["Incorrect username and/or password"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def new
    @user = User.new
  end


end
