module Api
  class InterestsController < ApiController
    def show
      @interest = Interest.find(params[:id])
      render :show, json: @interest
    end
  end
end