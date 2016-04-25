class SearchedController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    # @current_user = current_user
    @friendships = Friendship.all


    # @user = User.find(session[:user_id])
    # @profile = @user.profile

    # @profile = Profile.find(params[:id])
    # @current_user = current_user
    # @friendships = Friendship.all
    # @profiles = Profile.all
    # @users = User.all
    # render :show
  end
end
