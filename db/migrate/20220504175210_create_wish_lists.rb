# frozen_string_literal: true

class CreateWishLists < ActiveRecord::Migration[5.2]
  def change
    create_table :wish_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true
      t.string :gift_name
      t.string :gift_url

      t.timestamps
    end
  end
end
