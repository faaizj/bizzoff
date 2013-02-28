class AdminUser < ActiveRecord::Base
  attr_accessible :username
  belongs_to :admin_role
end
