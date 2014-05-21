module Api
  class InterestsController < ApiController

    def index
      @interests = User.find(params[:user_id]).interests
      render :index, json: @interests
    end

    def show
      @interest = Interest.find(params[:id])
      render partial: "api/interests/interest", locals: { interest: @interest }
    end

  end
end