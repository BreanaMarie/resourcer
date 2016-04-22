class ProfilesController < ApplicationController
  include ProfilesHelper
  def index
    @profiles = Profile.all
    render :index
  end

  def show
    @profile = Profile.find(params[:id])
    @current_user = current_user
    @friendships = Friendship.all
    @profiles = Profile.all
    @users = User.all
    render :show
  end

  def new
    @profile = Profile.new
    render :new
  end

  def create
    profile_params = params.require(:profile).permit(:user_id, :firstname, :lastname, :role, :city, :state, :linkedin, :image, :bio)
    @profile = Profile.create(profile_params)
    add_default_image @profile
    render :new
  end

  def edit
    @profile = Profile.find(params[:id])
    render :edit
  end

  def update
    @profile = Profile.find(params[:id])
    updated_attributes = params.require(:profile).permit(:user_id, :firstname, :lastname, :role, :city, :state, :linkedin, :image, :bio)
    @profile.update_attributes(updated_attributes)
    add_default_image @profile
    redirect_to @profile
  end

  def destroy
    Profile.destroy(params[:id])
    redirect_to "/"
  end

end
