class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.references :gift_type, null: false, foreign_key: true 
      t.string :tittle
      t.integer :wishlist_max
      t.float :price_min
      t.float :price_max
      t.float :fixed_price

      t.timestamps
    end
  end
end