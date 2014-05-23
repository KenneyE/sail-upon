class UsersController < ApplicationController
  before_action :ensure_logged_out, only: [:new]
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notices] = ["Welcome, #{@user.username}!"]
      login!(@user)
      redirect_to "#/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
