class MakeProductionDayIdNotNullInPallets < ActiveRecord::Migration[7.1]
  def change
    change_column_null :pallets, :production_day_id, false
  end
end
