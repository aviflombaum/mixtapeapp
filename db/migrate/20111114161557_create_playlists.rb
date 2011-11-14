class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :song_id
      t.integer :mixtape_id

      t.timestamps
    end
  end
end
