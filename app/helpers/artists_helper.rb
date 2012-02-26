module ArtistsHelper
  
  def artist_song_count(artist)
    if artist.song_count <= 0
      "<td>NO SONGS!!!</td>"
    else
      "<td>#{artist.song_count}</td>"
    end
  end
  
end
