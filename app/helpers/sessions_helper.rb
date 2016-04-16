module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user.id
  end

  def logged_in?
    if current_user == nil
    else
      true
    end
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def current_user 
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end
end
