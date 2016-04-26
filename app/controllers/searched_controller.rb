class SearchedController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    @friendships = Friendship.all
  end
end
