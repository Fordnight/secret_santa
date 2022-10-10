class SecretFriend < ActiveRecord::Migration[6.1]
  def up
    add_reference :player_lists, :secret_friend, index: true, foreign_key: {to_table: :players }, null: true
  end
  def down
    remove_reference :player_lists, :secret_friend, index: true, foreign_key: {to_table: :players }
  end
end
