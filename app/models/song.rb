class Song < ActiveRecord::Base
  belongs_to :artist

  has_many :playlists
  has_many :mixtapes, :through => :playlists
end
