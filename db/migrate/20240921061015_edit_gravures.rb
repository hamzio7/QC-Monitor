class EditGravures < ActiveRecord::Migration[7.1]
  def change
    change_column :gravures, :low, :decimal
    change_column :gravures, :high, :decimal
    add_column :gravures, :line_number, :integer
    add_column :pallets, :line_number, :integer
    add_column :production_days, :line_number, :integer
    add_column :reaction_times, :line_number, :integer
    rename_column :resin_programs, :line, :line_number
    change_column :resin_programs, :line_number, :integer
    add_column :temperatures, :line_number, :integer
    add_column :volatile_contents, :line_number, :integer

  end
end
