class Mixtape < ActiveRecord::Base
  has_many :playlists
  has_many :songs, :through => :playlists
  
  validates_presence_of :name
  accepts_nested_attributes_for :songs
  
  after_initialize(:on => :create) do
    self.songs.build if self.songs.blank?
  end
end
