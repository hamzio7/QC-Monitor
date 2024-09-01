class ChangeDataTypes < ActiveRecord::Migration[7.1]
  def change

    change_column(:pallets, :color_number, :string)
    change_column(:pallets, :glossiness, :string)
    change_column(:pallets, :line_speed, :string)
    change_column(:pallets, :initial_grammage, :string)
    change_column(:pallets, :quantity, :string)
    change_column(:pallets, :final_grammage_max, :string)
    change_column(:pallets, :final_grammage_min, :string)
    change_column(:pallets, :grammage_min_set, :string)
    change_column(:pallets, :grammage_max_set, :string)
    change_column(:pallets, :volatile_content_min, :string)
    change_column(:pallets, :volatile_content_set_max, :string)
    change_column(:pallets, :volatile_content_set_min, :string)
    change_column(:pallets, :volatile_content_max, :string)

  end
end
