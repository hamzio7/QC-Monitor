class ChangeDateTime < ActiveRecord::Migration[7.1]
  def change

    change_column :pallets, :production_date, :datetime
    change_column :pallets, :production_time, :time
    change_column :line_stops, :time_stopped, :time
    change_column :line_stops, :time_restarted, :time
    change_column :mf_tanks, :date, :datetime
    change_column :uf_tanks, :date, :datetime
    change_column :production_days, :production_date, :datetime

  end
end
