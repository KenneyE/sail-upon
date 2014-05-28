module Api
  class WebsitesController < ApiController
    def create
      @website = current_user.submitted_sites.new(website_params)
      @website.title = "web-title"


      interest_ids = interest_params.map do |interest|
        Interest.find_by_name(interest.titleize).try(:id)
      end

      interest_ids.compact! #get rid of the ones not in the db
      @website.interest_ids = interest_ids
      if @website.save
        render json: @website
      else
        render json: @website.errors.full_messages, status: :unprocessable_entity
      end
    end


    def show
      unless current_user.interests.empty?
        begin
          interest = current_user.interests.sample
          @website = interest.find_website_by_interest
        end until @website
      else
        @website = Website.all.sample
      end
      render partial: "api/websites/website", locals: { website: @website }
    end

    private
    def website_params
      params.require(:website).permit(:url)
    end

    def interest_params
      params.permit(:website_interests => []).require(:website_interests)
    end
  end
end
