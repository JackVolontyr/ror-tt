class CreateRouteStationJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :routes_stations, id: false do |t|
      t.belongs_to :route, index: true
      t.belongs_to :station, index: true
    end
  end
end
