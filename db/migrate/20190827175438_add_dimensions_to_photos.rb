class AddDimensionsToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :width, :integer, default: 0
    add_column :photos, :height, :integer, default: 0
  end
end
