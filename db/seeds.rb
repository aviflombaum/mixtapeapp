# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  
# Create a User
  admin = User.create(:username => "admin", :email => "admin@flombaum.com", :password => "testtest")
  avi = User.create(:username => "avi", :email => "avi@flombaum.com", :password => "testtest")
  jon = User.create(:username => "jon", :email => "avi@flombaum.com", :password => "testtest")  
  
  users = [admin, avi, jon]
  
# Create a mixtape
  # Loop through the contents of a directory
    # for each file, check if it's an mp3
    # if it's an mp3 file, create a song
     # parse the file for an artist name
     # read the file data
     # create a song with the file data and the artist
  # Add all the songs to the mixtape
   # require "mp3info"

  puts "Importing #{Rails.root}/db/seed/songs..."
  @songs = Importers::Songs.new_from_dir("#{Rails.root}/db/seed/songs")
  
  users.each do |user|
    @mixtape = user.mixtapes.build(:name => "#{user.username}'s Favorite Songs")

    puts "Initialized Mixtape - #{@mixtape.name}..."

    # File API - http://www.ruby-doc.org/core-1.9.2/File.html
    # Dir API - http://www.ruby-doc.org/core-1.9.2/Dir.html
    # Dir.entries vs Dir.foreach

    # Dir.entries("#{Rails.root}/db/seed/songs").each do |file

    @mixtape.playlists << @songs.collect{|s| @mixtape.playlists.build(:song => s)}

    if @mixtape.save
      @mixtape.add_user(user, :owner)
            
      (users-[user]).each do |u| 
        puts "Addin #{u.username} to #{@mixtape.name} as a listener"
        @mixtape.add_user(u, :listener) 
      end
        
      puts "#{@mixtape.name} created with #{@songs.count} songs." 
    else
      puts "Could not save mixtape because\n"
      puts @mixtape.errors.full_messages
    end
  end