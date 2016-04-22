class WelcomeController < ApplicationController
  def index
    @user = User.new
    @current_user = current_user
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      login(user)
      redirect_to dashboard_index_path
    else
      flash.now.alert = "Email or password not recognized"
      
    end
  end
end
