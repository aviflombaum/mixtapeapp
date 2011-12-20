class User < ActiveRecord::Base
  has_secure_password

  has_many :user_mixtapes, :inverse_of => :user
  has_many :mixtapes, :through => :user_mixtapes

  has_many :identities

  validates :password, :presence => true, :on => :create
  validates :password, :confirmation => true
  
  acts_as_autocomplete :on => :username
  
  def self.find_or_create_from_auth_hash(auth_hash)
    user = Identity.find_user_by_auth_hash(auth_hash) ||
           User.create_from_auth_hash(auth_hash)
  end
  
  def self.create_from_auth_hash(auth_hash)
    password_token = SecureRandom.urlsafe_base64
    user = self.new(:username => auth_hash.info.name, :password => password_token, :password_confirmation => password_token)
    if user.save
      user.identities.create(:uid => auth_hash.uid, :provider => auth_hash.provider)
    end
    return user
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  private
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
