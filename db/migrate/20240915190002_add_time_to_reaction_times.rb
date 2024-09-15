class AddTimeToReactionTimes < ActiveRecord::Migration[7.1]
  def change
    add_column :reaction_times, :time, :datetime
  end
end
