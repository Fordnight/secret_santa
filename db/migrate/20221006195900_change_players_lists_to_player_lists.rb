class ChangePlayersListsToPlayerLists < ActiveRecord::Migration[6.1]
  def change
    rename_table :players_lists, :player_lists
  end
end
