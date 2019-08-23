class AddScUrlToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sc_url, :string, default: ""
  end
end
