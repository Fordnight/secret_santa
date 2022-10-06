class CreatePlayersLists < ActiveRecord::Migration[6.1]
  def change
    create_table :players_lists do |t|
      t.references :player,  null: false, foreign_key: true
      t.references :list,  null: false, foreign_key: true
      t.timestamps
    end
     drop_table :user_lists
  end
end
