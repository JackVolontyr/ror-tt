class RenameColumnsStationFirstLastInTicket < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :station_first, :station_first_id
    rename_column :tickets, :station_last, :station_last_id
  end
end
