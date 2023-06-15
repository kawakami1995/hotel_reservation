class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.integer :stay_days
      t.integer :number_of_people
      t.integer :payment_amount
      t.datetime :reservation_confirmed_datetime

      t.timestamps
    end
  end
end
