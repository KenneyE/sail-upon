module Api
  class WebsitesController < ApiController
    def show
      interest = current_user.interests.sample
      @website = interest.find_website_by_interest
      render partial: "api/websites/website", locals: { website: @website }
    end
  end
end
