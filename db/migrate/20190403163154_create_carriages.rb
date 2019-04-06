class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :number
      t.string :carriage_type
      t.string :seats, default: '{
        "1": true,
        "2": true,
        "3": true,
        "4": true,
        "5": true,
        "6": true,
        "7": true,
        "8": true
      }'
      t.belongs_to :train, index: true
    end
  end
end
