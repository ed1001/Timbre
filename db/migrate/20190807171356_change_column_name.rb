class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :url, :photo
  end
end
