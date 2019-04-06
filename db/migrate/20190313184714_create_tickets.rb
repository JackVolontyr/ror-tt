class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.belongs_to :train, index: true
      t.belongs_to :user, index: true
      t.integer :station_first, index: true
      t.integer :station_last, index: true
    end
  end
end
