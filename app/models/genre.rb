class Genre < ActiveRecord::Base
  has_many :genrefications
  has_many :songs, :through => :genrefications
end
