class CreateOvenTemps < ActiveRecord::Migration[7.1]
  def change
    create_table :oven_temps do |t|
      t.integer :oven_number
      t.decimal :temperature
      t.datetime :time

      t.timestamps
    end
  end
end
