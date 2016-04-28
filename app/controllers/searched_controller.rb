class SearchedController < ApplicationController
  def show
    @current_user = current_user
    @profile = Profile.find(params[:id])
    @friendships = Friendship.all
  end
end
