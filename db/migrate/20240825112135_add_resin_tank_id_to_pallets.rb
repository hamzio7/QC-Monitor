class AddResinTankIdToPallets < ActiveRecord::Migration[7.1]
  def change
    add_column :pallets, :resin_tank_id, :integer
  end
end
