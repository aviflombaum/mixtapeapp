class CreateUserMixtapes < ActiveRecord::Migration
  def change
    create_table :user_mixtapes do |t|
      t.references :mixtape
      t.references :user
      t.integer :permission

      t.timestamps
    end
  end
end
