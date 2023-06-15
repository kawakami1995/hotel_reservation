class ChangeDatatypeStayDaysOfReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :stay_days, :integer 
  end
end
