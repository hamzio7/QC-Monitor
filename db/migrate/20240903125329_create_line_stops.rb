class CreateLineStops < ActiveRecord::Migration[7.1]
  def change
    create_table :line_stops do |t|
      t.string :date
      t.string :line_number
      t.string :time_stopped
      t.string :time_restarted
      t.string :reason
      t.string :shift

      t.timestamps
    end
  end
end
