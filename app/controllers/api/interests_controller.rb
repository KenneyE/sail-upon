module Api
  class InterestsController < ApiController

    def destroy
      @interest = Interest.find(params[:id])
      @interest.destroy
      render partial: "api/interests/interest", locals: { interest: @interest }
    end

    def index
      @interests = User.find(params[:user_id]).interests
      render :index, jlocals: { interest: @interests }
    end

    def full_index
      @interests = Interest.all
      render :index, locals: { interest: @interests }
    end

    def show
      @interest = Interest.find(params[:id])
      render partial: "api/interests/interest", locals: { interest: @interest }
    end

  end
end