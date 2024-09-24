class SchedulesController < ApplicationController
  def index

    get_date

    # Fetch records
    @pallets = Pallet.where(date: @date).where(shift: @shift_name.to_s.upcase).where(line_number: @line_number)
    @temperatures = Temperature.where(date: @date)
    @oven_temps = Oven.where(date: @date)
    @gravures = Gravure.where(date: @date)
    @reaction_times = ReactionTime.where(date: @date)
    @volatile_contents = VolatileContent.where(date: @date)

    # Generate and match time slots
    @time_slots = generate_time_slots(@shift)
    @pallets_by_slot = match_records_to_time_slots(@pallets, @time_slots)
    @temperatures_by_slot = match_records_to_time_slots(@temperatures, @time_slots)
    @oven_temps_by_slot = match_records_to_time_slots(@oven_temps, @time_slots)
    @gravures_by_slot = match_records_to_time_slots(@gravures, @time_slots)
    @reaction_times_by_slot = match_records_to_time_slots(@reaction_times, @time_slots)
    @volatile_contents_by_slot = match_records_to_time_slots(@volatile_contents, @time_slots)
  end

  private

  def get_date
    @date = if params[:date].present?
              params[:date].to_s
            else
              cookies[:date].present? ? cookies[:date] : Parsi::Date.today.to_gregorian.to_s
            end

    @shift = if params[:shift].present?
               params[:shift].to_s
             else
               cookies[:shift].present? ? cookies[:shift] : "day"
             end

    @line_number = if params[:line_number].present?
                     params[:line_number].to_s
                   else
                     cookies[:line_number].present? ? cookies[:line_number] : "1"
                   end
    @shift_name = if params[:shift_name].present?
                    params[:shift_name].to_s
                  else
                    cookies[:shift_name].present? ? cookies[:shift_name] : "C"
                  end

    cookies[:line_number] = { value: @line_number, expires: 1.year.from_now }
    cookies[:shift] = { value: @shift, expires: 1.year.from_now }
    cookies[:date] = { value: @date.to_s, expires: 1.year.from_now }
    cookies[:shift_name] = { value: @shift_name, expires: 1.year.from_now }
  end

  def generate_time_slots(shift)
    start_time, end_time = shift == 'day' ? %w[07:00 19:00] : %w[19:00 07:00]
    start_time = Time.parse(start_time)
    end_time = Time.parse(end_time) + (end_time < start_time ? 1.day : 0)

    slots = []
    while start_time <= end_time
      slots << start_time.strftime("%H:%M")
      start_time += 30.minutes
    end
    slots
  end

  def match_records_to_time_slots(records, time_slots)
    records_by_slot = {}
    records.each do |record|
      logger.debug " time : " + record.time.to_s
    end

    time_slots.each do |slot|
      records_by_slot[slot] = records.find { |record| round_to_nearest_30(record.time) == slot }
    end
    records_by_slot
  end

  def round_to_nearest_30(time)
    minutes = time.min
    if minutes < 15
      rounded_time = time.change(min: 0)
    elsif minutes < 45
      rounded_time = time.change(min: 30)
    else
      rounded_time = (time + 1.hour).change(min: 0)
    end
    rounded_time.strftime("%H:%M")
  end

end
