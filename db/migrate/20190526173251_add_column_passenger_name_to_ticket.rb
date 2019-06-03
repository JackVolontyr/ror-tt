class AddColumnPassengerNameToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :route_id, :integer
    add_column :tickets, :comments, :string
  end
end
