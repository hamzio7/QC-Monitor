class AddTimeToVolatileContents < ActiveRecord::Migration[7.1]
  def change
    add_column :volatile_contents, :time, :datetime
  end
end
