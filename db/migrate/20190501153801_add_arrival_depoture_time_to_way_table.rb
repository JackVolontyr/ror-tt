class AddArrivalDepotureTimeToWayTable < ActiveRecord::Migration[5.2]
  def change
    add_column :ways, :arrival, :string, default: "2x:xx"
    add_column :ways, :departure, :string, default: "2x:xx"
  end
end
