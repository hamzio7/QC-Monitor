class AddLineSpeedToPallets < ActiveRecord::Migration[7.1]
  def change
    add_column(:pallets, :line_speed, :integer, :default => 40)
    add_column(:pallets, :final_date, :string)
    add_column(:pallets, :actions_taken, :string)
    add_column(:pallets, :dimensions, :string, :default => "368x186")
    add_column(:pallets, :shift, :string)

    add_column(:production_days, :shift, :string)

    add_column(:uf_tanks, :time, :string)
    add_column(:uf_tanks, :shift, :string)

    add_column(:mf_tanks, :shift, :string)
    add_column(:mf_tanks, :time, :string)
  end
end
