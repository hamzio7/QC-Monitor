class CreateProductionDays < ActiveRecord::Migration[7.1]
  def change
    create_table :production_days do |t|
      t.date :production_date
      t.text :info
      t.integer :stopped_pallets_count
      t.integer :approved_pallets_count

      t.timestamps
    end
  end
end
