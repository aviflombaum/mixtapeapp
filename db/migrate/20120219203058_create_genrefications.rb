class CreateGenrefications < ActiveRecord::Migration
  def change
    create_table :genrefications do |t|
      t.integer :song_id
      t.integer :genre_id
      t.timestamps
    end
  end
end
