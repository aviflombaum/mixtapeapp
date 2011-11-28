class Artist < ActiveRecord::Base
  has_many :songs

  def self.names
    order('name ASC').collect{|a| a.name}
  end
  
end
