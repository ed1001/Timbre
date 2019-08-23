class ChangeOpposedUserToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :opposed_user_id
    add_column :likes, :opposed_user_id, :integer
  end
end
