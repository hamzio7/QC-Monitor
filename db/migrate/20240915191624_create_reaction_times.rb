class CreateReactionTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :reaction_times do |t|
      t.decimal :gel_time
      t.decimal :cloudy_time
      t.datetime :time

      t.timestamps
    end
  end
end
