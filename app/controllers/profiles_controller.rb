class ProfilesController < ApplicationController
  helper_method :sort_column, :sort_direction

  include ProfilesHelper
  def index
    @profiles = Profile.search(params[:search])
    # @profiles = Profile.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])


    @profiles = Profile.all
   
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

  private
  
  def sort_column
    Profile.column_names.include?(params[:sort]) ? params[:sort] : "full_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
