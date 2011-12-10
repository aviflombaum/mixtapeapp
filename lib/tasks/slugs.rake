namespace :slugs do
  desc 'Generate slugs for mixtapes'
  task :mixtapes => :environment do
    # Mixtape.find_each do |mixtape|
    #   mixtape.save
    # end
    # Mixtape.find_each {|m| m.save}
    Mixtape.find_each(&:save)
  end
end
