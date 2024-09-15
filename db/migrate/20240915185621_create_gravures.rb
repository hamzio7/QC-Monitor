class CreateGravures < ActiveRecord::Migration[7.1]
  def change
    create_table :gravures do |t|
      t.decimal :h
      t.decimal :l

      t.timestamps
    end
  end
end
