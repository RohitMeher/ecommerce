class AdminController < ApplicationController
  layout "admin_layout"

  def authenticate
    user_params = params[:user]
    user = User.find_by(email: user_params[:email])
    if user && user.password == user_params[:password]
      if user.is_admin
        flash[:notice] = "login is succesfull"
        login_as user
        redirect_to products_path
      else
        flash[:error] = "You don't have permission to login to the admin portal"
        redirect_to admin_login_path
      end
    else
      flash[:error] = "Your Email Address or password is incorrect"
      redirect_to admin_login_path
    end
  end

  def logout
    session.delete(:admin_user_id) if session[:admin_user_id]
    redirect_to admin_login_path
  end

  def login_as(user)
    session[:admin_user_id] = user.id
  end

  def current_user
    User.find(session[:admin_user_id]) if session[:admin_user_id]
  end

  def is_user_logged_in
    unless current_user
      flash[:error] = "You need to login to access this page"
      redirect_to admin_login_path and return
    end
  end
end