class AddResinTankIdToPallets < ActiveRecord::Migration[7.1]
  def change
    add_column :pallets, :mf_tank_id, :integer
    add_column :pallets, :uf_tank_id, :integer
  end
end
