class CreateGravures < ActiveRecord::Migration[7.1]
  def change
    create_table :gravures do |t|
      t.decimal :high
      t.decimal :low
      t.datetime :time

      t.timestamps
    end
  end
end
