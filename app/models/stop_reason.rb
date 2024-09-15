class StopReason < ApplicationRecord
  has_many :pallet_stop_reasons, dependent: :destroy
  has_many :pallets, through: :pallet_stop_reasons
end