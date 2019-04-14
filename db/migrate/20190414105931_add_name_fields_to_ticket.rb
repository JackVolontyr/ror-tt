class AddNameFieldsToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :user_name, :string
  end
end
