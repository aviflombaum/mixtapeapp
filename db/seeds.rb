# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create a mixtape
# Loop through the contents of a directory
  # for each file, check if it's an mp3
  # if it's an mp3 file, create a song
   # parse the file for an artist name
   # read the file data
   # create a song with the file data and the artist
# Add all the songs to the mixtape
 # require "mp3info"
 
@mixtape = Mixtape.new(:name => "My Favorite Songs")
puts "Initialized Mixtape - #{@mixtape.name}..."

@songs = []

# File API - http://www.ruby-doc.org/core-1.9.2/File.html
# Dir API - http://www.ruby-doc.org/core-1.9.2/Dir.html
# Dir.entries vs Dir.foreach

# Dir.entries("#{Rails.root}/db/seed/songs").each do |file

puts "Opening #{Rails.root}/db/seed/songs..."

Dir.foreach("#{Rails.root}/db/seed/songs") do |file_name|
  next if file_name == "." || file_name == ".."
  puts "...processing #{file_name}"

  # How to check if it's an MP3
  
  # if file_name.split(".").last != "mp3"
  #   puts "......skipping #{file_name} because it isn't an mp3" 
  #   next
  # end
  
  file = File.new("#{Rails.root}/db/seed/songs/#{file_name}", 'r')
  
  if File.extname(file.path) != ".mp3"
    puts "......skipping #{file_name} because it isn't an mp3" 
    next
  end
  
  # https://www.ruby-toolbox.com/gems/ruby-mp3info
  # https://github.com/moumar/ruby-mp3info
  # http://rubydoc.info/gems/ruby-mp3info/frames
  
  mp3 = Mp3Info.open(file.path)
  
  song = Song.new :name => mp3.tag.title, :artist_name => mp3.tag.artist, :audio => file
  
  (@songs << song) and puts "......saving #{song.artist.name}  - #{song.name} (#{song.audio.original_filename})" if song.save
end

@mixtape.songs << @songs
puts "#{@mixtape.name} created with #{@songs.count} songs." if @mixtape.save