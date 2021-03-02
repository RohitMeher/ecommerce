class ApplicationController < ActionController::Base
  
  def login_as(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def logout
    session.delete(:user_id) if session[:user_id]
  end
   
  def is_user_logged_in
    unless current_user
      flash[:error] = "You need to login to access this page"
      redirect_to user_login_path and return
    end
  end
end
