class Song < ActiveRecord::Base
  has_attached_file :audio
  
end
