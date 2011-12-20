class Identity < ActiveRecord::Base
  belongs_to :user
  
  validates :uid, :uniqueness => {:scope => :provider}
  
  def self.find_user_by_auth_hash(auth_hash)
    identity = self.find_by_provider_and_uid(auth_hash.provider, auth_hash.uid)
    identity.user if identity
  end
end
