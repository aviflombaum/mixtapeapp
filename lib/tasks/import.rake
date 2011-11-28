namespace :import do

  desc 'Imports songs from a directory'
  task :songs => :environment do
    songs = Importers::Songs.new_from_dir ENV['DIR']
    songs.each do |s| s.save end
  end

end
  