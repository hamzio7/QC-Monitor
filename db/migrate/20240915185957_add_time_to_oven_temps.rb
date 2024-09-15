class AddTimeToOvenTemps < ActiveRecord::Migration[7.1]
  def change
    add_column :oven_temps, :time, :datetime
  end
end
