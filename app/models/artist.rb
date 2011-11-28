class Artist < ActiveRecord::Base  
  SortOptions = {
   :name => {:column => "name", :order => "ASC"}, 
   :songs =>{:column => "songs_count", :order => "DESC"}  
  }
  
  has_many :songs
  
  scope :by_name, order("name ASC")
  scope :by_songs_count, order("songs_count DESC") # all.sort{|a| a.songs.count}
  
  
  def self.names
    by_name.collect{|a| a.name}
  end
  
  def self.all_or_search(search, params = {})   
    (search.blank? ? 
                 self :
                 self.starts_with(search)
               ).
               by(params.slice(:sort, :order))
               
  end
  
  def self.by(options = {})
    options[:sort] = :name if !options[:sort] || !SortOptions.has_key?(options[:sort].to_sym)
    
    sort_sql = "#{SortOptions[options[:sort].to_sym][:column]} "
    sort_sql += "#{options[:order] || SortOptions[options[:sort].to_sym][:order]}"
    order(sort_sql)
  end
  
  def self.starts_with(name)
    self.where("name LIKE :search", :search => "#{name}%")
  end
end