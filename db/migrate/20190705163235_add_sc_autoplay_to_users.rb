class AddScAutoplayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sc_autoplay, :boolean, default: false
  end
end
