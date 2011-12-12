class Mixtape < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  has_many :playlists, :inverse_of => :mixtape
  has_many :songs, :through => :playlists

  has_many :user_mixtapes, :inverse_of => :mixtape
  has_many :users, :through => :user_mixtapes
  
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
  
  before_save { add_songs_by_ids }
  before_create  { assign_playlist_position }
  
  attr_accessor :song_ids_to_add

  # def song_ids_to_add=(ids_delimited)
  #   songs_to_add = Song.find(ids_delimited.split(","))
  #   songs_to_add.each do |song|
  #     self.playlists.build(:song => song)
  #   end
  # end
  
  def add_user(user, permission)
    user_mixtapes.find_or_create_by_user_id(user.id).set_permission permission
  end
  
  def editable_by?(user)
    !!user_mixtapes.find_by_user_id(user).try(:editable?)
  end

  def listenable_by?(user)
    !!user_mixtapes.find_by_user_id(user).try(:listenable?)
  end

  def destroyable_by?(user)
    !!user_mixtapes.find_by_user_id(user).try(:destroyable?)
  end
  
  private
    def add_songs_by_ids
      return if song_ids_to_add.blank?
      songs_to_add = Song.find(self.song_ids_to_add.split(","))
      songs_to_add.each do |song|
        self.playlists.build(:song => song)
      end
    end
    
    def assign_playlist_position
      self.playlists.each_with_index do |playlist, index|
        playlist.position ||= index+1
      end
    end
end
