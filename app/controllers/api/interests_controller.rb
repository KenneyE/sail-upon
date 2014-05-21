module Api
  class InterestsController < ApiController

    def index

      @interests = User.find(params[:user_id]).interests

      render :index, json: @interests
    end

    def show
      @interest = Interest.find(params[:id])
      render :show, json: @interest
    end

  end
end