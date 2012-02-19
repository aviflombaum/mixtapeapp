class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.references :mixtape
      t.references :song
      t.timestamps
    end
  end
end
