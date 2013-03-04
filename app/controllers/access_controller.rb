class AccessController < ApplicationController
 before_filter :confirm_logged_in, :except =>[:login,:logout,:attempt_login]
  
 layout('admin')
  def dashboard
  end
  
  def index
    redirect_to(:action=>'dashboard')
  end
  
  def login
    
  end
  
  def logout
     session[:user_id] = nil
     session[:user_name] = nil
      flash[:notice] ="You are now logged out"
      redirect_to(:action=>'login')
  end
  def attempt_login
    authorized_user = AdminUser.authenticate(params[:username],params[:pwd])
    if authorized_user
      session[:user_id] = authorized_user.id
     session[:user_name] = authorized_user.username
      flash[:notice] ="You are now logged in"
      redirect_to(:action=>'dashboard')
    else
      flash[:notice] ="Invalid username/password combination"
      redirect_to(:action=>'login')
    end
  end
end
