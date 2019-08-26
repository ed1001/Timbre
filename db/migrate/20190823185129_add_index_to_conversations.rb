class AddIndexToConversations < ActiveRecord::Migration[5.2]
  def change
    add_index :conversations, [:recipient_id, :sender_id], unique: true
  end
end
