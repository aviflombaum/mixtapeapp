class AddAttachmentAudioToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :audio_file_name, :string
    add_column :songs, :audio_content_type, :string
    add_column :songs, :audio_file_size, :integer
    add_column :songs, :audio_updated_at, :datetime
  end

  def self.down
    remove_column :songs, :audio_file_name
    remove_column :songs, :audio_content_type
    remove_column :songs, :audio_file_size
    remove_column :songs, :audio_updated_at
  end
end
