class CreateGiftTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :gift_types do |t|
      t.string :name

      t.timestamps
    end
  end
end