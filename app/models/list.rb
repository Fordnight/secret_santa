# frozen_string_literal: true

class List < ApplicationRecord
  has_many :player_lists
  has_many :players, through: :player_lists

  belongs_to :gift_type

  def self.create_list(list_params)
    new_list = List.create({ title: list_params[:title], gift_type_id: list_params[:gift_type_id] })

    if new_list

      list_params[:players].each do |_i, player|
        new_list.players.create!(player)
      end
    end
  end

  def run_raffle
    assigned = []
    available_players = []

    players.each do |player|
      available_players = players.collect(&:id) - [player.id] - assigned

      if available_players.empty?
        interchangable_user = PlayerList.find(players.first.id)
        available_players.push interchangable_user.secret_friend_id
        interchangable_user.update(secret_friend_id: player.id)
      end

      secret_friend = available_players.sample
      assigned.push(secret_friend)
      player_raffle = self.player_lists.find_by_player_id(player.id)
      player_raffle.update(secret_friend_id: secret_friend)
    end
  end
end
