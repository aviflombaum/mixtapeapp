module ArtistsHelper
  
  def artist_names
    Artist.names.collect{|a| a.name}
  end
  
end
