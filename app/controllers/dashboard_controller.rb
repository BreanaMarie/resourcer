class DashboardController < ApplicationController
  def index
    @profiles = Profile.all
    @current_user = current_user
    
  end
end
