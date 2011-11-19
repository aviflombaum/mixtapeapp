class Mixtape < ActiveRecord::Base
  has_many :playlists
  has_many :songs, :through => :playlists
  
  validates_presence_of :name
  accepts_nested_attributes_for :songs, :reject_if => lambda { |m| m[:audio].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :playlists, :allow_destroy => true
  
  # after_initialize(:on => :create) do
  #   self.songs.build if self.songs.blank?
  # end
end
