class AddProductionTimeToPallets < ActiveRecord::Migration[7.1]
  def change
    change_column :pallets, :production_time, :datetime
  end
end
