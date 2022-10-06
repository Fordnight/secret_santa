class Player < ApplicationRecord
  has_many :player_lists
  has_many :lists, through: :player_lists
end