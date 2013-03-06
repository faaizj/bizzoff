class AdminUser < ActiveRecord::Base
  attr_accessible :username
  attr_accessor :pwd  
  attr_protected :hashed_password,:salt
  
  belongs_to :admin_role 
  validates_presence_of :admin_role

  
  validates :username, :presence => true , :length => {:within => 8..25 } , :uniqueness => true
  validates :email , :uniqueness => true, :length =>{:maximum => 150 } , :presence => false
 
   validates_length_of :pwd, :within => 8..25, :on => :save 
    
   before_save :create_hashed_password
   after_save :clear_password
    
def password_match?(pwd="")
  # '==' means its a boolean expression and the result is always boolean
   hashed_password == AdminUser.hash_with_salt(pwd,salt)
   
end
 
def self.hash_with_salt(pwd="",salt="")
  unless pwd.blank?
    Digest::SHA1.hexdigest("This will be my #{salt} on the #{pwd} according to #{Date.today}")
  end
  
end

def self.make_salt(username="")
  Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
end
 
 #authenticate user
def self.authenticate(username="",pwd="")
  user = AdminUser.find_by_username(username) 
   if user && user.password_match?(pwd)
     return user
   else
     return false
   end
  
end

private

def clear_password
  self.hashed_password = nil
end

def create_hashed_password
  # Whenever :password has a value hashing is needed
  self.salt = AdminUser.make_salt(username) if salt.blank?
  self.hashed_password = AdminUser.hash_with_salt(pwd,salt)
end
end
