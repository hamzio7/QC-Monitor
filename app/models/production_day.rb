class ProductionDay < ApplicationRecord
  has_many :pallets, dependent: :destroy

  # Method to update counters based on pallets' status
  def update_pallet_counts
    self.approved_pallets_count = pallets.where(status: 'Approved').count
    self.stopped_pallets_count = pallets.where(status: 'Stopped').count
    save
  end
end
