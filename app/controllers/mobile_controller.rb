class MobileController < ApplicationController
  def index
  
  end
  
  def register_new(uname="",password="", email ="")
    user = AdminUser.new
    user.admin_role=AdminRole.find(1)
    user.pwd=password
    user.email=email
     
    user.save
    
  end
end
