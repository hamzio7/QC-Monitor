class AddProductionDayIdToLineStops < ActiveRecord::Migration[7.1]
  def change
    add_column :line_stops, :production_day_id, :integer
    add_column :resin_programs, :production_day_id, :integer
  end
end
