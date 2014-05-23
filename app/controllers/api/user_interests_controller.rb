module Api
  class UserInterestsController < ApiController
    def create
      user_interest = UserInterest.new(user: current_user,
      interest_id: params[:interest_id])
      user_interest.save!
      render json: "Followed"

    end

    def destroy
      user_interest = UserInterest.where(user_id: current_user,
        interest_id: params[:interest_id]).limit(1)
      UserInterest.destroy(user_interest.first)
      render json: "Unfollowed"
    end
  end

end
