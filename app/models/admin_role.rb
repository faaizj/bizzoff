class AdminRole < ActiveRecord::Base
  attr_accessible :role_name
  has_many :admin_users
  
end
