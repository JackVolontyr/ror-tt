class WayJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :ways do |t|
      t.belongs_to :station, index: true
      t.belongs_to :route, index: true
      t.integer :position, default: 1, null: false
    end
  end
end
