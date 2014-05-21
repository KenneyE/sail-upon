class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    username = params[:username]
    password = params[:password]
    @user = User.find_by_credentials(username, password)

    if @user
      flash[:notices] = ["Welcome, #{@user.username}!"]
      login!(@user)
    else
      flash[:errors] = ["Incorrect username and/or password"]
      render new
    end
  end


end
