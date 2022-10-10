class PlayerList < ApplicationRecord
  belongs_to :player
  belongs_to :list
  belongs_to :secret_friend, class_name: 'Player', foreign_key: :secret_friend_id
end
