module UsersHelper
  def friend_request
    user_id = current_user.id
    friend_id = params[:id] # this is the id of the user you want to become friend with
    friendship = Friendship.create(user_id: user_id, friend_id: friend_id, status: false)
  end
end
