class AddPositionToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :position, :integer
  end
end
