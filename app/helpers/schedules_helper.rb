module SchedulesHelper
  # Find the nearest pallet for a given time slot
  def nearest_pallet_for_time(pallets, time)
    pallets.select { |pallet| pallet.time.to_date == time.to_date }
           .min_by { |pallet| (pallet.time - time).abs }
  end

  def column_width(index)
    case index
    when 0 then 'auto' # Time column
    when 1 then '1' # Pallet #
    when 2 then '1' # Reaction Times
    when 3 then '1' # Volatile Content
    when 4 then '3' # Temperatures
    when 5 then '1' # Gravures
    when 6 then '4' # Ovens' Temperatures
    else
      # type code here
    end
  end

  def column_headers(index)
    case index
    when 0 then [{ text: 'Time' }]
    when 1 then [{ text: 'Pallet #' }]
    when 2 then [{ text: 'Gel Time', border: true }, { text: 'Cloudy Time' }]
    when 3 then [{ text: 'Min', border: true }, { text: 'Max' }]
    when 4 then [
      { text: 'UF', border: true },
      { text: 'MF', border: true },
      { text: 'MF Paper', border: true },
      { text: 'PR Paper', border: true },
      { text: 'Chiller' }
    ]
    when 5 then [{ text: 'High', border: true }, { text: 'Low' }]
    when 6 then (1..11).map { |i| { text: "Oven #{i}", border: i < 11 } }
    else
      # type code here
    end
  end
end
