class Pallet < ApplicationRecord
  require 'parsi-date'

  has_many :pallet_stop_reasons, dependent: :destroy
  has_many :stop_reasons, through: :pallet_stop_reasons

  belongs_to :production_day
  belongs_to :uf_tank, class_name: 'UfTank', foreign_key: 'uf_tank_id', optional: true
  belongs_to :mf_tank, class_name: 'MfTank', foreign_key: 'mf_tank_id', optional: true

  after_initialize :set_default_values, if: :new_record?
  after_commit :update_production_day_counters, on: [:create, :destroy]

  before_save :adjust_attrs

  def adjust_attrs

    hijri_date_parts = date.to_s.split('-') # Assuming the date is in 'YYYY-MM-DD' format
    hijri_year = hijri_date_parts[0].to_i
    hijri_month = hijri_date_parts[1].to_i
    hijri_day = hijri_date_parts[2].to_i
    gregorian_date = Parsi::Date.new(hijri_year, hijri_month, hijri_day).to_gregorian
    self.date = gregorian_date.to_date

  end

  private

  def update_production_day_counters
    production_day.update_pallet_counts
  end

  def set_default_values
    today = Parsi::Date.today
    time_now = Time.now

    self.attributes = {
      date: today.to_gregorian,
      pallet_number: format("%02d%d", today.year % 100, today.month),
      color_number: 1014,
      line_speed: 40,
      time: format("%02d:%02d", time_now.hour, time_now.min),
      quantity: 1200,
      initial_grammage: 81,
      volatile_content_set_min: 5.0,
      volatile_content_set_max: 5.3,
      grammage_min_set: initial_grammage.to_f + 104,
      grammage_max_set: initial_grammage.to_f + 110
    }.merge(self.attributes.compact)
  end
end
