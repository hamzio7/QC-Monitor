class CreateVolatileContents < ActiveRecord::Migration[7.1]
  def change
    create_table :volatile_contents do |t|
      t.decimal :min
      t.decimal :max
      t.datetime :time

      t.timestamps
    end
  end
end
