class AddColumnsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_name, :string
    add_column :reservations, :room_introduction, :text
    add_column :reservations, :price, :integer
    add_column :reservations, :address, :string
    add_column :reservations, :room_image, :string
  end
end
