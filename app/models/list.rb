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
end
