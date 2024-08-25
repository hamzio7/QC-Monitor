class MfTank < ApplicationRecord
  has_one :pallet, foreign_key: 'mf_tank_id'

  def display_info
    "Tank: #{tank_number} - Date: #{date.gsub("-","/")}"
  end

end
