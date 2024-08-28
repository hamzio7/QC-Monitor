class Pallet < ApplicationRecord

  require 'parsi-date'
  belongs_to :production_day

  belongs_to :uf_tank, class_name: 'UfTank', foreign_key: 'uf_tank_id'
  belongs_to :mf_tank, class_name: 'MfTank', foreign_key: 'mf_tank_id'

  after_initialize :set_default_values, if: :new_record?

  private

  after_save :update_production_day_counters
  after_destroy :update_production_day_counters

  def update_production_day_counters
    production_day.update_pallet_counts
  end

  def set_default_values

    persian_date = Parsi::Date.today.to_s
    year, month = separate_jalali_date(persian_date)
    time = Time.now.hour.to_s + ":" + Time.now.min.to_s

    self.production_date ||= persian_date.to_s.gsub("-", "/")
    self.pallet_number ||= year.to_s + month.to_s
    self.color_number ||= 1014
    self.production_time ||= time
    self.quantity ||= 1200
    self.initial_grammage ||= 81
    self.volatile_content_set_min ||= 5.0
    self.volatile_content_set_max ||= 5.3
    self.grammage_min_set ||= 185.0
    self.grammage_max_set ||= 190.0
  end

  def separate_jalali_date(jalali_date_str)
    # Split the date string by the dash ('-') character
    year, month = jalali_date_str.split('-')

    # Convert them to integers if needed
    year = last_two_characters(year)
    month = month.to_i

    [year, month]
  end

  def last_two_characters(str)
    # Ensure the string is long enough
    if str.length >= 2
      last_two = str[-2..-1]
    else
      last_two = str # or handle the case as needed
    end

    # Output the result
    puts last_two
    # Return the result if needed
    last_two
  end

end
