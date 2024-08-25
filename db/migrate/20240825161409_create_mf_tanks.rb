class CreateMfTanks < ActiveRecord::Migration[7.1]
  def change
    create_table :mf_tanks do |t|
      t.string :date
      t.float :initial_temp
      t.integer :tank_number
      t.float :ph
      t.float :viscosity
      t.float :density
      t.integer :reaction_time

      t.timestamps
    end
  end
end
