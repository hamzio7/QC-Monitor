class AddMidlineToTemperatures < ActiveRecord::Migration[7.1]
  def change
    add_column :temperatures, :midline, :string
  end
end
