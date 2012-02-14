class AddDescriptionToMixtape < ActiveRecord::Migration
  def change
    add_column :mixtapes, :description, :text
  end
end
