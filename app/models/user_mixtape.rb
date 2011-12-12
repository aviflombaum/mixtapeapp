class UserMixtape < ActiveRecord::Base
  Permissions = {:owner => 1, :collaborator => 2, :listener => 3}
  
  belongs_to :mixtape, :inverse_of => :user_mixtapes
  belongs_to :user, :inverse_of => :user_mixtapes

  # after_create { send_share_notification }
  
  def set_permission(permission)
    self.update_attributes({:permissions => Permissions[permission]})
  end
  
  def editable?
    true if [Permissions[:owner], Permissions[:collaborator]].include?(self.permissions)
  end
  
  def destroyable?
    true if [Permissions[:owner]].include?(self.permissions)
  end
  
  def listenable?
    true if [Permissions[:owner], Permissions[:collaborator], Permissions[:listener]].include?(self.permissions)
  end
  
  # private
  #   def send_share_notifiaction
  #     UserMailer.shared_mixtape(self.user, self.mixtape).deliver
  #   end
end
