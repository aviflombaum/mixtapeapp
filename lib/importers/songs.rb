class Importers::Songs
  
  def self.new_from_dir(path)
    songs = []
    Dir.foreach(path) do |file_name|
      next if file_name == "." || file_name == ".."
      puts "...processing #{file_name}"

      # How to check if it's an MP3

      # if file_name.split(".").last != "mp3"
      #   puts "......skipping #{file_name} because it isn't an mp3" 
      #   next
      # end

      file = File.new("#{path}/#{file_name}", 'r')

      if File.extname(file.path) != ".mp3"
        puts "......skipping #{file_name} because it isn't an mp3" 
        next
      end

      # https://www.ruby-toolbox.com/gems/ruby-mp3info
      # https://github.com/moumar/ruby-mp3info
      # http://rubydoc.info/gems/ruby-mp3info/frames

      mp3 = Mp3Info.open(file.path)

      song = Song.new :name => mp3.tag.title, :artist_name => mp3.tag.artist, :audio => file

      (songs << song) and puts "......saving #{song.artist.name}  - #{song.name} (#{song.audio.original_filename})" if song.save
    end
    
    return songs
  end
  
end
