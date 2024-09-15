class ResinProgram < ApplicationRecord
  belongs_to :production_day

  after_initialize :set_default_values, if: :new_record?

  private

  def set_default_values
    persian_date = Parsi::Date.today.to_s
    current_time = Time.now.strftime("%H:%M")

    self.attributes = {
      date: persian_date,
      time: current_time
    }.merge(self.attributes.compact)
  end
end
