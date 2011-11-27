# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  
# Create a User
  User.create(:username => "admin", :email => "avi@flombaum.com", :password => "testtest")

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

  # File API - http://www.ruby-doc.org/core-1.9.2/File.html
  # Dir API - http://www.ruby-doc.org/core-1.9.2/Dir.html
  # Dir.entries vs Dir.foreach

  # Dir.entries("#{Rails.root}/db/seed/songs").each do |file

  puts "Importing #{Rails.root}/db/seed/songs..."

  @songs = Importers::Songs.new_from_dir("#{Rails.root}/db/seed/songs")

  @mixtape.playlists << @songs.collect{|s| @mixtape.playlists.build(:song => s)}

  if @mixtape.save
    puts "#{@mixtape.name} created with #{@songs.count} songs." 
  else
    puts "Could not save mixtape because\n"
    puts @mixtape.errors.full_messages
  end