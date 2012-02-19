class Song < ActiveRecord::Base
  belongs_to :artist

  has_many :playlists
  has_many :mixtapes, :through => :playlists
  
  has_many :genrefications
  has_many :genres, :through => :genrefications
  
end
