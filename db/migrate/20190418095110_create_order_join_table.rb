class CreateOrderJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, id: false do |t|
      t.belongs_to :station, index: true
      t.belongs_to :ticket, index: true
    end
  end
end
