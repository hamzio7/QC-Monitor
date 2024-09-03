json.extract! line_stop, :id, :date, :line_number, :time_stopped, :time_restarted, :reason, :shift, :created_at, :updated_at
json.url line_stop_url(line_stop, format: :json)
