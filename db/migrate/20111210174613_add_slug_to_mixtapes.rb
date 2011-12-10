class AddSlugToMixtapes < ActiveRecord::Migration
  def change
    add_column :mixtapes, :slug, :string
    
    add_index :mixtapes, :slug, :unique => true
  end
end
