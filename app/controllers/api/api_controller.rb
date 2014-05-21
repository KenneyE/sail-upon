module Api
  class ApiController < ApplicationController
    before_action :ensure_logged_in
  end
end