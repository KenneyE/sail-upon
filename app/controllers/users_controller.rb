class UsersController < ApplicationController
  before_action :ensure_logged_in, except: [:new, :create]
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notices] = ["Welcome, #{@user.username}!"]
      login!(@user)
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
