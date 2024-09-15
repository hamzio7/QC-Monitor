class PalletStopReason < ApplicationRecord
  belongs_to :pallet
  belongs_to :stop_reason
end
