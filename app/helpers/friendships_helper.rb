module FriendshipsHelper
  def friend_request_accept
    # accepting a friend request is done by the recipient of the friend request.
    # thus the current user is identified by friend_id.
    friendship = Friendship.find(params[:id])
    friendship.update_attributes(status: 'confirm')
  end

  # def friend_delete
  #   friendship = Friendship.where(friend_id: current_user.id, user_id: params[:id]).first
  #   friendship.destroy
  # end

  def friend_request 
    @friendship.update_attribute(:status,'pending')
  end

  def friend_request_ignore
    friendship = Friendship.find(params[:id])
    @friendship.update_attribute(:status, 'ignore')
  end
end
