module Api
  class UsersController < ApiController

    def show
      @user = current_user
      render :show, json: @user
    end

    private
    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
end