class Artist < ActiveRecord::Base
  has_many :songs, :dependent => :nullify
  
  def self.search(search, sort = nil)
    results = (if search.blank?
      Artist
    else
      Artist.starts_with(search)
    end)
    
  end
  
  def self.by(sort)
    case sort
      when 'name'
        order("name ASC")
      when 'songs_count'
        order("songs_count DESC")
      else
        order("created_at DESC")
    end
  end
  
  def self.starts_with(letter)
    Artist.where("name LIKE ?", "#{letter}%")
  end
  
  def self.names
    self.order("name ASC").select("name")
  end
  
  # def songs_count
  #   songs.count
  # end
  
end