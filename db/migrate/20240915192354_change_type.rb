class ChangeType < ActiveRecord::Migration[7.1]
  def change
    change_column :reaction_times, :cloudy_time, :string
    change_column :reaction_times, :gel_time, :string
  end
end
