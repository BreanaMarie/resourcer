class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @current_user = current_user

    render :index
  end

  def show
    @message = Message.find_by_id(params[:id])
    @user = User.find_by_id(message.user_id)
    @current_user = current_user
    @friendship = Friendship.find_by_id(@message.friendship_id)
    @friendships = Friendship.all

    render :show
  end

  def new
    @message = Message.new
    @friendships = Friendship.all
    @user = User.find(current_user)
    @current_user= current_user

    render :new
  end

  def create
    message_params = params.require(:message).permit(:title, :author, :body, :friendship_id, :user_id)
    @message = Message.create(message_params)
    @current_user= current_user
    @friendships = Friendship.all
   
    if @message.save
      redirect_to @message 
    else 
      render :new
    end
  end
end
