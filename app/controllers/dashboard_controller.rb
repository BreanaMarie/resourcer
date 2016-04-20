class DashboardController < ApplicationController
  def index
    profiles = Profile.all
    profile =  Profile.find_by_id(params[:id])
    @current_user = current_user
    
  end
end
