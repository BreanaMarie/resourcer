class ProfilesController < ApplicationController
  include ProfilesHelper

  helper_method :sort_column, :sort_direction

  def index
   
    if params[:search]
      @profiles = Profile.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 15, :page => params[:page])
    else
      @profiles = Profile.all.order(sort_column + " " + sort_direction).paginate(:per_page => 15, :page => params[:page])
    end
   
  end

  def show
    @user = User.find(session[:user_id])
    @profile = @user.profile

    # @profile = Profile.find(params[:id])
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
    profile_params = params.require(:profile).permit(:user_id, :firstname, :lastname, :role, :city, :state, :linkedin, :image, :bio, :seeker, :company, :department)
    @profile = Profile.create(profile_params)
    add_default_image @profile
    render :new
  end

  def edit
    @user = User.find(session[:user_id])
    @profile = @user.profile

    # @profile = Profile.find(params[:id])
    render :edit
  end

  def update
    @profile = Profile.find(params[:id])
    updated_attributes = params.require(:profile).permit(:user_id, :firstname, :lastname, :role, :city, :state, :linkedin, :image, :bio, :seeker, :company, :department)
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
    Profile.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
