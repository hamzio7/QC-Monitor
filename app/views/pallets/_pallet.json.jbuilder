json.extract! pallet, :id, :pallet_number, :production_date, :production_time, :color_number, :quantity, :customer, :initial_grammage, :final_grammage_min, :final_grammage_max, :uf_tank, :mf_tank, :cloudy_time, :gel_time, :volatile_content_set_min, :volatile_content_set_max, :volatile_content_min, :volatile_content_max, :glossiness, :supervisor, :status, :stop_reason, :info, :final_supervisor, :final_status, :final_stop_reason, :final_info, :created_at, :updated_at
json.url pallet_url(pallet, format: :json)
