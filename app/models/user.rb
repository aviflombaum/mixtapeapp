class User < ActiveRecord::Base
  has_secure_password #=> password_digest

end
