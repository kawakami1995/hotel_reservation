class ChangeDataStayDaysToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :stay_days, :date
  end
end
