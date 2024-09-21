class Oven < ApplicationRecord
  require 'parsi-date'

  before_save :adjust_attrs
  def adjust_attrs

    hijri_date_parts = date.to_s.split('-') # Assuming the date is in 'YYYY-MM-DD' format
    hijri_year = hijri_date_parts[0].to_i
    hijri_month = hijri_date_parts[1].to_i
    hijri_day = hijri_date_parts[2].to_i
    gregorian_date = Parsi::Date.new(hijri_year, hijri_month, hijri_day).to_gregorian
    self.date = gregorian_date.to_date

  end
end
