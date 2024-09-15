class MfTank < ApplicationRecord
  has_one :pallet, foreign_key: 'mf_tank_id'
  belongs_to :production_day

  after_initialize :set_default_values, if: :new_record?

  def display_info
    "Tank: #{tank_number} - Date: #{formatted_date}"
  end

  private

  def set_default_values
    persian_date = Parsi::Date.today
    current_time = Time.now.strftime("%H:%M")

    self.attributes = {
      date: persian_date,
      time: current_time
    }.merge(self.attributes.compact)
  end

  # Memorizing the formatted date to avoid recalculating it every time.
  def formatted_date
    @formatted_date ||= Date.civil(Date.today.year, Date.today.month, Date.today.day).to_parsi
  end
end
