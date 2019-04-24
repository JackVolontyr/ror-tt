class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.string :carriage_type
      t.string :seats
      t.belongs_to :train, index: true
    end
  end
end
