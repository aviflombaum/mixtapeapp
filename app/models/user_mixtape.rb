class UserMixtape < ActiveRecord::Base
  Permissions = {:owner => 1, :collaborator => 2, :listener => 3}
  
  belongs_to :mixtape, :inverse_of => :user_mixtapes
  belongs_to :user, :inverse_of => :user_mixtapes

  def set_permission(permission)
    self.update_attribute(:permissions, Permissions[permission])
  end
  
  def editable?
    true if self.permissions < 3
  end
  
  def destroyable?
    true if self.permssions < 2
  end
  
end
