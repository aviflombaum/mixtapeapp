class AddSongsCountToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :songs_count, :integer, :default => 0

  end
end
