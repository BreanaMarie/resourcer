class FriendshipsController < ApplicationController
  include FriendshipsHelper
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      friend_request
      redirect_to dashboard_index_path
    else
      flash[:error] = "Unable to add friend."
      redirect_to dashboard_index_path
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    friend_request_ignore
    flash[:notice] = "Friendship request ignored"
    redirect_to dashboard_index_path
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    friend_request_accept
    flash[:notice] = "Accepted friendship."
    redirect_to dashboard_index_path


  end
end
