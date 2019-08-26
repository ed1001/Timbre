class AddBioToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :string, default: "Hello, I'm using Timbre!"
  end
end
