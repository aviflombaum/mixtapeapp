class Playlist < ActiveRecord::Base
  belongs_to :mixtape, :inverse_of => :playlists
  belongs_to :song, :inverse_of => :playlists
  
  validates :position, :uniqueness => {:scope => :mixtape_id}
  
  accepts_nested_attributes_for :song, :allow_destroy => true, :reject_if => lambda {|s| s[:audio].blank?}

end
