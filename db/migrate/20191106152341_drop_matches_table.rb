class DropMatchesTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :matches
  end
end
