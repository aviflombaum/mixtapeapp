class Playlist < ActiveRecord::Base
  belongs_to :mixtape, :inverse_of => :playlists
  belongs_to :song, :inverse_of => :playlists
  
end
