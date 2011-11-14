class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :playlists
  has_many :mixtapes, :through => :playlists
  
  has_attached_file :audio

  # http://rubydoc.info/github/thoughtbot/paperclip/master/Paperclip/ClassMethods:validates_attachment_content_type
  # https://netfiles.uiuc.edu/xythoswfs/static/en/content_type.htm
  validates_attachment_presence :audio
  validates_attachment_content_type :audio, :content_type => /^audio/
  
  def artist_name
    self.artist.name if self.artist.present?
  end
  
  def artist_name=(string)
    self.artist = Artist.find_or_create_by_name(string)
  end
  
end
