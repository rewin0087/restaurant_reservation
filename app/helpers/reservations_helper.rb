module ReservationsHelper
  def current_hour
    date_time = @date_time.to_time
    start_time = date_time.strftime('%I:%M %p')
    end_time = (date_time + 1.hour).strftime('%I:%M %p')
    "#{start_time} - #{end_time}"
  end

  def display_readable_date_time(date_time)
    date_time.strftime("%b %d, %Y %H:%M")
  end
end
