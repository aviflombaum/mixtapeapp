class Genre < ActiveRecord::Base
  has_many :genrefications
  has_many :songs, :through => :genrefications
  
  def self.for_select
    self.all.map{|g| [g.name, g.id]}
  end

end
