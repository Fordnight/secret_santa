# frozen_string_literal: true

class ChangeColumnTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :tittle, :title
  end
end
