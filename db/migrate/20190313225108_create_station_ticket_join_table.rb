class CreateStationTicketJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :stations_tickets, id: false do |t|
      t.belongs_to :station, index: true
      t.belongs_to :ticket, index: true
    end
  end
end
