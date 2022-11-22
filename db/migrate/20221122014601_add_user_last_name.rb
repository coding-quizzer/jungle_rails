class AddUserLastName < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |table|
      table.column :last_name, :string
      table.rename :name, :first_name
    end
  end
end
