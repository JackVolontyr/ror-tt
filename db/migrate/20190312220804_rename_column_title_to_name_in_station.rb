class RenameColumnTitleToNameInStation < ActiveRecord::Migration[5.2]
  def change
    rename_column :stations, :title, :name
  end
end
