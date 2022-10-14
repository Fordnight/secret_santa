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

    players.each do |player|
      secret_friend = available_players(player, assigned).sample
      assigned.push(secret_friend)
      player_raffle = player_lists.find_by_player_id(player.id)
      player_raffle.update(secret_friend_id: secret_friend)
    end
  end

private
  def interchange_player(player)
    interchangable_user = player_lists.find_by_player_id(players.first.id)
    available_user = interchangable_user.secret_friend_id
    interchangable_user.update(secret_friend_id: player.id)
    available_user
  end

  def available_players(player, assigned)
      non_assigned = players.collect { |p| p.id }
      non_assigned -= [player.id] + assigned
      non_assigned.push interchange_player(player) if non_assigned.empty?
      non_assigned
  end
end