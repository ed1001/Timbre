class CreateAvoids < ActiveRecord::Migration[5.2]
  def change
    create_table :avoids do |t|
      t.references :user, foreign_key: true
      t.integer :opposed_user_id

      t.timestamps
    end
  end
end
