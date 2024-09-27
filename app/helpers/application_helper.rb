module ApplicationHelper

  def supervisors = [['Hamza Taffakh', 'Hamza Taffakh'],
                     ['Saeed Khadem', 'Saeed Khadem'],
                     ['Saeed Yousefi', 'Saeed Yousefi'],
                     ['Ahmad Jandane', 'Ahmad Jandane'],
                     ['Navid Mombeiny', 'Navid Mombeiny']
  ].sort

  def default_date(model)
    if @date.present?
      Date.parse(@date).to_parsi
    else
      model.new_record? ? Date.today.to_parsi : Date.parse(model.date).to_parsi
    end
  end

  def default_time(model)
    if @time.present?
      Time.parse(@time).strftime("%H:%M")
    else
      model.new_record? ? Time.now.strftime("%H:%M") : model.time.strftime("%H:%M")
    end
  end

  def times = [%w[Day day], %w[Night night]]

  def shifts = [%w[A A], %w[B B], %w[C C]]

  def lines = [%w[1 1], %w[2 2], %w[3 3]]

  def finishes = [%w[Glossy Glossy], %w[Matte Matte], %w[Fancy Fancy]]

  def status = [%w[Approved Approved], %w[Stopped Stopped]]

  def to_parsi(date)
    date.to_parsi
  end

  def date_to_gregorian(date)
    Date.civil(date.year, date.month, date.day).to_parsi.to_gregorian
  end

end
