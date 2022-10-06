# frozen_string_literal: true

class WishList < ApplicationRecord
  belongs_to :user
  belongs_to :list
end
