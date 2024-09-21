class CreateGravures < ActiveRecord::Migration[7.1]
  def change
    create_table :gravures do |t|
      t.string :date
      t.datetime :time
      t.integer :high
      t.integer :low

      t.timestamps
    end
  end
end
