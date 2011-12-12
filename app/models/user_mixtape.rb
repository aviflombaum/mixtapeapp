class UserMixtape < ActiveRecord::Base
  belongs_to :mixtape, :inverse_of => :user_mixtapes
  belongs_to :user, :inverse_of => :user_mixtapes
  
end
