class Mixtape < ActiveRecord::Base
  has_many :playlists, :inverse_of => :mixtape
  has_many :songs, :through => :playlists
  
  validates_presence_of :name

  # Explicitly not allowing songs to be created from a mixtape
  # because playlists are too important to be missed
  # has to do with position of songs in a playlist for instance.
  # AF - Nov 26 2011
  # accepts_nested_attributes_for :songs, :reject_if => lambda { |m| m[:audio].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :playlists, :allow_destroy => true, :reject_if => lambda {|s| s[:song_attributes] && s[:song_attributes][:audio].blank? }
  
  # after_initialize(:on => :create) do
  #   self.songs.build if self.songs.blank?
  # end
  
  before_create  { assign_playlist_position }
  
  attr_reader :song_names
  
  private
  
    def assign_playlist_position
      self.playlists.each_with_index do |playlist, index|
        playlist.position ||= index+1
      end
    end
end
