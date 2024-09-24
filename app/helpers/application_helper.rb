module ApplicationHelper

  def supervisors = [['Hamza Taffakh', 'Hamza Taffakh'],
                     ['Saeed Khadem', 'Saeed Khadem'],
                     ['Saeed Yousefi', 'Saeed Yousefi'],
                     ['Ahmad Jandane', 'Ahmad Jandane'],
                     ['Navid Mombeiny', 'Navid Mombeiny']
  ].sort

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
