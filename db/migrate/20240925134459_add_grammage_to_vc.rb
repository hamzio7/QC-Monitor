class AddGrammageToVc < ActiveRecord::Migration[7.1]
  def change
    add_column :volatile_contents, :grammage_min, :decimal
    add_column :volatile_contents, :grammage_max, :decimal
  end
end
