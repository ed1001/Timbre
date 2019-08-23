class AddDefaultValueToRange < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :range, :integer, default: 5
  end
end
