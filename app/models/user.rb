class User < ActiveRecord::Base
  has_secure_password #=> password_digest

  has_many :user_mixtapes
  has_many :mixtapes, :through => :user_mixtapes
end
