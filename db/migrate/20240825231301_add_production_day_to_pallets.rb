class AddProductionDayToPallets < ActiveRecord::Migration[7.1]
  def change
    add_reference :pallets, :production_day, foreign_key: true, null: true
  end
end
