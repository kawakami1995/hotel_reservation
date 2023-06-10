class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_detail
      t.integer :price
      t.string :address
      t.text :room_introduction

      t.timestamps
    end
  end
end
