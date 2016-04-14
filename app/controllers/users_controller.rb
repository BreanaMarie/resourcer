class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def destroy
  end
end
