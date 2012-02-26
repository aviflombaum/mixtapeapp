class Artist < ActiveRecord::Base
  has_many :songs, :dependent => :nullify
  
  
  
  def song_count
    songs.count
  end
  
end
