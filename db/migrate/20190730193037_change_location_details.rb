class ChangeLocationDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :location
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
