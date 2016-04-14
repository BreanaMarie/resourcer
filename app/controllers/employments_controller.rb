class EmploymentsController < ApplicationController
  def index
    @employments = Employment.all
    @profiles = Profile.all
  end

  def show
    @employment = Employment.find_by_id(params[:id])
    render :show
  end

  def new
    @employment = Employment.new
    render :new
  end

  def create
    employment_params = params.require(:employment).permit(:profile_id, :industry, :title, :company, :companyimg, :city, :state, :summary, :startdate, :enddate, :status)
    @employment = Employment.create(employment_params)
    if @employment.save
      redirect_to @employment
    else
      render :new
    end
  end

  def edit
    @employment = Employment.find(params[:id])
    render :edit
  end

  def update
    @employment = Employment.find(params[:id])
    employment_params = params.require(:employment).permit(:profile_id, :industry, :title, :company, :companyimg, :city, :state, :summary, :startdate, :enddate, :status)
    @employment.update_attributes(employment_params)
    
  end

  def destroy
  end
end
