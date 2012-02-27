class Mixtape < ActiveRecord::Base
  has_many :playlists
  has_many :songs, :through => :playlists
  
  validates :name, :presence => true
    
  accepts_nested_attributes_for :songs
  
end
