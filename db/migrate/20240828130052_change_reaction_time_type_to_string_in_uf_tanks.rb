class ChangeReactionTimeTypeToStringInUfTanks < ActiveRecord::Migration[7.1]
  def change
    change_column :uf_tanks, :reaction_time, :string
    change_column :mf_tanks, :reaction_time, :string
  end
end
