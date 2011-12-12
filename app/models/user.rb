class User < ActiveRecord::Base
  has_secure_password

  has_many :user_mixtapes, :inverse_of => :user
  has_many :mixtapes, :through => :user_mixtapes
  
  validates :password, :presence => true, :on => :create
  validates :password, :confirmation => true
  
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
