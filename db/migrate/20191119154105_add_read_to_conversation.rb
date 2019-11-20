class AddReadToConversation < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :read_sender, :boolean, default: false
    add_column :conversations, :read_recipient, :boolean, default: false
  end
end
