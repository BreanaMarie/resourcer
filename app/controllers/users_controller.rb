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
    @user = User.create( user_params)
  end

  def destroy
  end
end
