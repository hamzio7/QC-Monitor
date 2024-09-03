class AddPressQualityPallet < ActiveRecord::Migration[7.1]
  def change
    add_column :pallets , :pallet_quality, :string
  end
end
