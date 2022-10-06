# frozen_string_literal: true

class List < ApplicationRecord
  has_many :user_lists
  has_many :users, through: :user_lists

  belongs_to :gift_type

  def self.create_list(list_params)
    new_list = List.create({ title: list_params[:title], gift_type_id: list_params[:gift_type_id] })

    if new_list

      list_params[:users].each do |_i, user|
        new_list.users.create!(user)
      end
    end
  end
end
