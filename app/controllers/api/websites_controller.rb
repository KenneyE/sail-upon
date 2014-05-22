module Api
  class WebsitesController < ApiController
    def show
      interest = current_user.interests.sample
      if interest
        @website = interest.find_website_by_interest
      else
        @website = Website.all.sample
      end
      render partial: "api/websites/website", locals: { website: @website }
    end
  end
end
