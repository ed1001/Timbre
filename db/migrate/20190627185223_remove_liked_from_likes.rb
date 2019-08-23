class RemoveLikedFromLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :liked
    add_column :likes, :opposed_user_id, :string
  end
end
