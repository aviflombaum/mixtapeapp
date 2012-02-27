class Song < ActiveRecord::Base
  belongs_to :artist

  has_many :playlists
  has_many :mixtapes, :through => :playlists
  
  has_many :genrefications
  has_many :genres, :through => :genrefications
  
  has_attached_file :audio
  
  # accepts_nested_attributes_for :artist
  
  # def artist=(hash)
  #   self.artist = Artist.find_or_create_by_name(hash[:name])
  # end
  
  # before_save :set_genre_ids

  def artist_name
    self.artist.name if self.artist.present?
  end
  # 
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name name
  end

  # def set_genre_ids
  #   self.genre_ids ||= []
  # end
  
end
