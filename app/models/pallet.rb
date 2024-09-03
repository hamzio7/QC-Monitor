class Pallet < ApplicationRecord
  require 'parsi-date'

  belongs_to :production_day
  belongs_to :uf_tank, class_name: 'UfTank', foreign_key: 'uf_tank_id'
  belongs_to :mf_tank, class_name: 'MfTank', foreign_key: 'mf_tank_id'

  after_initialize :set_default_values, if: :new_record?

  after_save :update_production_day_counters
  after_destroy :update_production_day_counters

  private

  def update_production_day_counters
    production_day.update_pallet_counts
  end

  def set_default_values
    today = Parsi::Date.today
    time_now = Time.now

    self.production_date ||= today.to_s
    self.pallet_number ||= format("%02d%d", today.year % 100, today.month)
    self.color_number ||= 1014
    self.line_speed ||= 40
    self.production_time ||= format("%02d:%02d", time_now.hour, time_now.min)
    self.quantity ||= 1200
    self.initial_grammage ||= 81
    self.volatile_content_set_min ||= 5.0
    self.volatile_content_set_max ||= 5.3
    self.grammage_min_set ||= self.initial_grammage.to_f + 104
    self.grammage_max_set ||= self.initial_grammage.to_f + 110
  end
end
