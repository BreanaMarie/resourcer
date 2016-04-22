class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      login(user)
      redirect_to dashboard_index_path
    else
      flash.now.alert = "Email or password not recognized"
      render "new"
    end
  end

  def destroy
    logout
    redirect_to root_path 
  end
end
