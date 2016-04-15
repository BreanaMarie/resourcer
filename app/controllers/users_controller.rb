class UsersController < ApplicationController

# GET users/
  def index
    @users = User.all
    render :index
  end

# GET /users/id
  def show
  end

# GET /users/new
# creates user
  def new
    @user = User.new
  end

# POST /users
# saves user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "thanks!"
    else
      render "new"
    end
  end

# GET /users/id/edit
  def edit
  end

# PATCH/PUT /users/id
  def update
  end

  # DELETE /users/id
  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
