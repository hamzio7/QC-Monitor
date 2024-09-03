class MfTank < ApplicationRecord
  has_one :pallet, foreign_key: 'mf_tank_id'
  belongs_to :production_day
  after_initialize :set_default_values, if: :new_record?

  def display_info
    "Tank: #{tank_number} - Date: #{date.gsub("-", "/")}"
  end

  private

  def set_default_values
    persian_date = Parsi::Date.today.to_s
    time = Time.now.hour.to_s + ":" + Time.now.min.to_s

    self.date ||= persian_date.to_s
    self.time ||= time
  end

end
