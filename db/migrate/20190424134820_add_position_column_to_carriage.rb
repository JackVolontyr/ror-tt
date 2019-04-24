class AddPositionColumnToCarriage < ActiveRecord::Migration[5.2]
  def change
    add_column :carriages, :position, :integer
  end
end
