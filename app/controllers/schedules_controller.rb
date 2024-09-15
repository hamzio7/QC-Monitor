class SchedulesController < ApplicationController
  def index
    # Get the date from params, default to today if not provided
    date = params[:date] ? Date.parse(params[:date].to_s) : Date.today

    # Query pallets
    @pallets = Pallet.where("production_date BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)

    # Query temperatures, oven temps, gravures, reaction times, and volatile contents
    @temperatures = Temperature.where("time BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)
    @oven_temps = OvenTemp.where("time BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)
    @gravures = Gravure.where("time BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)
    @reaction_times = ReactionTime.where("time BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)
    @volatile_contents = VolatileContent.where("time BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)


    @time_slots_day = generate_time_slots("07:00", "19:00")
    @time_slots_night = generate_time_slots("19:00", "07:00")

    @pallets_by_slot = match_pallets_to_time_slots(@pallets, @time_slots_day)
    @temperatures_by_slot = match_records_to_time_slots(@temperatures, @time_slots_day)
    @oven_temps_by_slot = match_records_to_time_slots(@oven_temps, @time_slots_day)
    @gravures_by_slot = match_records_to_time_slots(@gravures, @time_slots_day)
    @reaction_times_by_slot = match_records_to_time_slots(@reaction_times, @time_slots_day)
    @volatile_contents_by_slot = match_records_to_time_slots(@volatile_contents, @time_slots_day)
  end

  private

  # Generate 30-minute intervals for the given date
  def generate_time_slots(start_time, end_time)
    start_time = Time.parse(start_time)
    end_time = Time.parse(end_time)
    time_slots = []

    while start_time <= end_time
      time_slots << start_time.strftime("%H:%M")
      start_time += 30.minutes
    end

    time_slots
  end

  def match_pallets_to_time_slots(pallets, time_slots)
    pallets_by_slot = {}

    time_slots.each do |slot|
      pallets_by_slot[slot] = pallets.find do |pallet|
        rounded_time = round_to_nearest_30(pallet.production_time)
        rounded_time == slot
      end
    end

    pallets_by_slot
  end

  def match_records_to_time_slots(records, time_slots)
    records_by_slot = {}

    time_slots.each do |slot|
      records_by_slot[slot] = records.find do |record|
        rounded_time = round_to_nearest_30(record.time)
        rounded_time == slot
      end
    end

    records_by_slot
  end

  # Round time to the nearest 30-minute interval
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
