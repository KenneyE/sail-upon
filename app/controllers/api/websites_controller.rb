module Api
  class WebsitesController < ApiController
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
  end
end
