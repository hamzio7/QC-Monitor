class CreateReactionTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :reaction_times do |t|
      t.string :gel_time
      t.string :cloudy_time

      t.timestamps
    end
  end
end
