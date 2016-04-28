class DashboardController < ApplicationController
  def index
    messages = Message.all
    profiles = Profile.all
    profile =  Profile.find_by_id(params[:id])
    @current_user = current_user
    @friendships = Friendship.all

  end
end
