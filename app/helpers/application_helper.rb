module ApplicationHelper

  def to_parsi(date)
    date.to_parsi
  end

  def date_to_gregorian(date)
    Date.civil(date.year, date.month, date.day).to_parsi.to_gregorian
  end

end
