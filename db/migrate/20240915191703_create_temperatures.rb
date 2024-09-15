class CreateTemperatures < ActiveRecord::Migration[7.1]
  def change
    create_table :temperatures do |t|
      t.decimal :uf
      t.decimal :mf
      t.decimal :mf_paper
      t.decimal :pr_paper
      t.decimal :chiller
      t.datetime :time

      t.timestamps
    end
  end
end
