class Mixtape < ActiveRecord::Base
  has_many :playlists, :inverse_of => :mixtape
  has_many :songs, :through => :playlists
  
  validates_presence_of :name
  accepts_nested_attributes_for :songs
  accepts_nested_attributes_for :playlists, :allow_destroy => true, :reject_if => lambda {|p| p[:song_attributes] && p[:song_attributes][:audio].blank?}
  
  # after_initialize(:on => :create) do
  #   self.songs.build if self.songs.blank?
  # end
  
  before_create  { assign_playlist_position }
  
  def assign_playlist_position
    self.playlists.each_with_index do |playlist, index|
      playlist.position ||= index+1
    end
  end
end
