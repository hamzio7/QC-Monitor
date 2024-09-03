class AddPDay < ActiveRecord::Migration[7.1]
  def change
    add_column :mf_tanks , :production_day_id, :integer
    add_column :uf_tanks , :production_day_id, :integer
  end
end
