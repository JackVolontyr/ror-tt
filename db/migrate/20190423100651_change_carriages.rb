class ChangeCarriages < ActiveRecord::Migration[5.2]
  def change
    add_column :carriages, :top_seats, :integer
    add_column :carriages, :bottom_seats, :integer
    add_column :carriages, :side_top_seats, :integer
    add_column :carriages, :side_bottom_seats, :integer
    add_column :carriages, :type, :string
  end
end
