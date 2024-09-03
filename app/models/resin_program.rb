class ResinProgram < ApplicationRecord
  belongs_to :production_day
  after_initialize :set_default_values, if: :new_record?

  private

  def set_default_values
    persian_date = Parsi::Date.today.to_s
    hours = Time.now.hour.to_s
    minutes = Time.now.min.to_s

    time = add_zero(hours) + ":" + add_zero(minutes)
    self.date ||= persian_date.to_s
    self.time ||= time
  end

  def add_zero(str)
    if str.length == 1
      str = "0" + str
    end
    str
  end
end
