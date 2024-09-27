class SchedulesController < ApplicationController
  def index
    get_date



    # Fetch records
    fetch_records

    # Generate time slots and match records to them
    @time_slots = generate_time_slots(@shift)
    @pallets_by_slot = match_records_to_time_slots(@pallets, @time_slots)
    @temperatures_by_slot = match_records_to_time_slots(@temperatures, @time_slots)
    @oven_temps_by_slot = match_records_to_time_slots(@oven_temps, @time_slots)
    @gravures_by_slot = match_records_to_time_slots(@gravures, @time_slots)
    @reaction_times_by_slot = match_records_to_time_slots(@reaction_times, @time_slots)
    @volatile_contents_by_slot = match_records_to_time_slots(@volatile_contents, @time_slots)

    # Initialize new records and fetch additional data
    initialize_new_records
    fetch_additional_data
  end

  private

  def get_date
    @date = params[:date].presence || cookies[:date] || Parsi::Date.today.to_gregorian.to_s
    @shift = params[:shift].presence || cookies[:shift] || "day"
    @line_number = params[:line_number].presence || cookies[:line_number] || "1"
    @shift_name = params[:shift_name].presence || cookies[:shift_name] || "C"

    store_in_cookies
  end

  def store_in_cookies
    cookies[:line_number] = { value: @line_number, expires: 1.year.from_now }
    cookies[:shift] = { value: @shift, expires: 1.year.from_now }
    cookies[:date] = { value: @date.to_s, expires: 1.year.from_now }
    cookies[:shift_name] = { value: @shift_name, expires: 1.year.from_now }
  end

  def fetch_records
    @pallets = Pallet.where(date: @date, shift: @shift_name.upcase, line_number: @line_number)
    @temperatures = Temperature.where(date: @date, line_number: @line_number)
    @oven_temps = Oven.where(date: @date, line_number: @line_number)
    @gravures = Gravure.where(date: @date, line_number: @line_number)
    @reaction_times = ReactionTime.where(date: @date, line_number: @line_number)
    @volatile_contents = VolatileContent.where(date: @date, line_number: @line_number)
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

    time_slots.each do |slot|
      records_by_slot[slot] = records.find { |record| round_to_nearest_30(record.time) == slot }
    end
    records_by_slot
  end

  def round_to_nearest_30(time)
    minutes = time.min
    rounded_time = case minutes
                   when 0...15 then time.change(min: 0)
                   when 15...45 then time.change(min: 30)
                   else (time + 1.hour).change(min: 0)
                   end
    rounded_time.strftime("%H:%M")
  end

  def initialize_new_records
    @gravure = Gravure.new
    @temperature = Temperature.new
    @pallet = Pallet.new
    @oven = Oven.new
    @reaction_time = ReactionTime.new
    @volatile_content = VolatileContent.new
  end

  def fetch_additional_data
    @stop_reasons = StopReason.all
    @uf_tanks = ResinTank.order(created_at: :desc).limit(5)
    @mf_tanks = ResinTank.order(created_at: :desc).limit(5)
  end
end
