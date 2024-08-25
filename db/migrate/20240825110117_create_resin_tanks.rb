class CreateResinTanks < ActiveRecord::Migration[7.1]
  def change
    create_table :resin_tanks do |t|
      t.integer :tank_number
      t.float :ph
      t.float :viscosity
      t.float :density
      t.float :initial_temp
      t.string :reaction_time
      t.float :solid_content

      t.timestamps
    end
  end
end
