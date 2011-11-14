class Song < ActiveRecord::Base
  belongs_to :artist
  
  has_attached_file :audio

  def artist_name
    self.artist.name if self.artist.present?
  end
  
  def artist_name=(string)
    self.artist = Artist.find_or_create_by_name(string)
  end
  
end
