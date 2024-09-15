class AddTimeToTemperatures < ActiveRecord::Migration[7.1]
  def change
    add_column :temperatures, :time, :datetime
  end
end
