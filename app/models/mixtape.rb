class Mixtape < ActiveRecord::Base
  has_many :playlists
  has_many :songs, :through => :playlists
  
  has_many :user_mixtapes
  has_many :users, :through => :user_mixtapes
  
  validates :name, :presence => true
    
  accepts_nested_attributes_for :songs
  
  def self.authorize_for_user(*permissions)
    permissions.each do |permission|
      define_method :"#{permission}able_by?" do |user|
        user_mixtapes.find_by_user_id(user).send(:"#{permission}able?")
      end
    end
  end
  
  authorize_for_user :edit, :listen, :destroy
  
  def add_user(user, permission)
    user_mixtapes.create(:user => user, :permission => UserMixtape::Permissions[permission])
  end
  
  # def editable_by?(user)
  #   user_mixtapes.find_by_user_id(user).try(:editable?)
  # end
  # 
  # def listenable_by?(user)
  #   user_mixtapes.find_by_user_id(user).try(:listenable?)    
  # end
  # 
  # def destroyable_by?(user)
  #   user_mixtapes.find_by_user_id(user).try(:destroyable?)    
  # end
  
end
