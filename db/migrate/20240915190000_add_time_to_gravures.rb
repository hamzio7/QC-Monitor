class AddTimeToGravures < ActiveRecord::Migration[7.1]
  def change
    add_column :gravures, :time, :datetime
  end
end
