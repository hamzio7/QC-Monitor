class CreateResinPrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :resin_programs do |t|
      t.string :date
      t.string :time
      t.string :uf_wlf
      t.string :uf_837
      t.string :uf_1448
      t.string :mf_es700
      t.string :mf_es501
      t.string :mf_1010
      t.string :mf_837
      t.string :mf_1014
      t.string :uf_tank_num
      t.string :mf_tank_num
      t.string :mixing_1
      t.string :mixing_2
      t.string :shift
      t.string :line

      t.timestamps
    end
  end
end
