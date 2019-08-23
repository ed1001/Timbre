class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :user, foreign_key: true
      t.integer :opposed_user_id

      t.timestamps
    end
  end
end
