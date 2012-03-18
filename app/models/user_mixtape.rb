class UserMixtape < ActiveRecord::Base
  Permissions = {:owner => 0, :collaborator => 1, :listener => 2}

  belongs_to :user
  belongs_to :mixtape
  
  def method_missing(method, *args)
    if method.match /able\?$/
      action = "#{method.to_s.match(/(.+)able\?$/)[1]}".to_sym
      role = case action
      when :edit
        :collaborator
      when :listen
        :listener
      when :destroy
        :owner
      end
      true if self.permission <= Permissions[role.to_sym]
    else
      super
    end
  end
end  