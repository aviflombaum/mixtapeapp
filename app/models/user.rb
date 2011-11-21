class User < ActiveRecord::Base
  has_secure_password
  
  validates :password, :presence => true, :on => :create
  validates :password, :confirmation => true
  
end
