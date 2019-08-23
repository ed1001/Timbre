class AddDefaultToRead < ActiveRecord::Migration[5.2]
  def change
    change_column :messages, :read, :boolean, default: false
  end
end
