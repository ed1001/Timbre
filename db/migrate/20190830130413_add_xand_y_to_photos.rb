class AddXandYToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :x, :integer, default: 0
    add_column :photos, :y, :integer, default: 0
  end
end
