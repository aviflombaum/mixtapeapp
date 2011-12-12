class CreateUserMixtapes < ActiveRecord::Migration
  def change
    create_table :user_mixtapes do |t|
      t.integer :user_id
      t.integer :mixtape_id
      t.integer :permissions
      t.timestamps
    end
  end
end
