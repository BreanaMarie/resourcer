class FriendshipsController < ApplicationController
  include FriendshipsHelper
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      friend_request
      redirect_to current_user.profile
    else
      flash[:error] = "Unable to add friend."
      redirect_to current_user.profile
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user.profile
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    friend_request_accept
    flash[:notice] = "Accepted friendship."
    redirect_to current_user.profile
  end
end
