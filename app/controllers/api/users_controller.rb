module Api
  class UsersController < ApiController

    def show
      @user = User.find(params[:id])
      render partial: "api/users/user", locals: { user: @user }
    end

    # def show_current
    #   render partial: "api/users/user", locals: { user: current_user }
    # end

    private
    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
end