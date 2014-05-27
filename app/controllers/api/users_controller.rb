module Api
  class UsersController < ApiController

    def show
      @user = User.find(params[:id])
      render partial: "api/users/user", locals: { user: @user }
    end

    def sail_count
      @user = current_user
      @user.sail_count += 1
      @user.save!
      render partial: "api/users/user", locals: { user: @user }

    end

    private
    def user_params
      params.require(:user).permit(:username, :password, :sail_count)
    end
  end
end