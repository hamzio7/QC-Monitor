module SchedulesHelper
  # Find the nearest pallet for a given time slot
  def nearest_pallet_for_time(pallets, time)
    pallets.select { |pallet| pallet.production_time.to_date == time.to_date }
           .min_by { |pallet| (pallet.production_time - time).abs }
  end


end
