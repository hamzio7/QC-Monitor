class CreateTemperatures < ActiveRecord::Migration[7.1]
  def change
    create_table :temperatures do |t|
      t.decimal :uf
      t.decimal :mf
      t.decimal :paper_mf
      t.decimal :paper_pr
      t.decimal :chiller

      t.timestamps
    end
  end
end
