module Api
  class UserInterestsController < ApiController
    def create
      user_interest = UserInterest.new(user: current_user, interest_id: params[:interest_id])
      if user_interest.save
        render json: {status: "Followed"}
      else
        render json: {status: :unprocessable_entity}
      end
    end

    def destroy
      user_interest = UserInterest.where(user_id: current_user,
        interest_id: params[:interest_id]).limit(1)
      UserInterest.destroy(user_interest.first)
      render json: {status: "Followed"}
    end
  end

end
