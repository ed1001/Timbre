class AddNewToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :new_sender, :boolean, default: true
    add_column :conversations, :new_recipient, :boolean, default: true
  end
end
