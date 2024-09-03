class ProductionDay < ApplicationRecord
  has_many :pallets, dependent: :destroy
  has_many :uf_tanks
  has_many :mf_tanks

  # Method to update counters based on pallets' status
  def update_pallet_counts
    self.approved_pallets_count = pallets.where(status: 'Approved').count
    self.stopped_pallets_count = pallets.where(status: 'Stopped').count
    save
  end
end
