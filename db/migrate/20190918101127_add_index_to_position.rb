class AddIndexToPosition < ActiveRecord::Migration[5.2]
  def change
    add_index :photos, :position
  end
end
