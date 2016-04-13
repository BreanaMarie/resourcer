class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
    render :index
  end

  def show
    @profile = Profile.find_by_id(params[:id])
    render :show
  end

  def new
    @profile = Profile.new
    render :new
  end

  def create
    profile_params = params.require(:profile).permit(:user_id, :firstname, :lastname, :address, :city, :state, :phone, :image, :bio)
    @profile = Profile.create(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    render :edit
  end

  def update
    @profile = Profile.find(params[:id])
    updated_attributes = params.require(:profile).permit(:user_id, :firstname, :lastname, :address, :city, :state, :phone, :image, :bio)
    @profile.update_attributes(updated_attributes)
    redirect_to @profile
  end

  def destroy
    Profile.destroy(params[:id])
    redirect_to "/"
  end
end
