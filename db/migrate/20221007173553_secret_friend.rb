class SecretFriend < ActiveRecord::Migration[6.1]
  def up
    add_column :player_lists, :secret_friend_id, :integer, null: true
  end
  def down
    remove_column :player_lists, :secret_friend_id, :integer
  end
end
