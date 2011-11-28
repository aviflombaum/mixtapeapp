class Artist < ActiveRecord::Base
  has_many :songs
  
  scope :by_name, order("name ASC")
  
  def self.names
    by_name.collect{|a| a.name}
  end
  
  def self.all_or_search(search)
    (search.blank? ? 
                 self :
                 self.starts_with(search)
               ).by_name
  end
  
  def self.starts_with(name)
    self.where("name LIKE :search", :search => "#{name}%")
  end
  
end
