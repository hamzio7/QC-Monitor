class CreateOvenTemps < ActiveRecord::Migration[7.1]
  def change
    create_table :oven_temps do |t|
      t.integer :oven_1
      t.integer :oven_2
      t.integer :oven_3
      t.integer :oven_4
      t.integer :oven_5
      t.integer :oven_6
      t.integer :oven_7
      t.integer :oven_8
      t.integer :oven_9
      t.integer :oven_10
      t.integer :oven_11

      t.timestamps
    end
  end
end
