class Table < ActiveRecord::Base
  has_many :reservations

  validates :chairs, :name, presence: true

  def self.find_vacants(datetime, total_seats)
    start_datetime = datetime.to_datetime.beginning_of_hour
    end_datetime = (start_datetime + 1.hour)

    table_ids = Reservation.select('table_id').where('date_time BETWEEN ? AND ? AND status IN(0,1)', start_datetime, end_datetime).uniq

    where('chairs >= ?', total_seats).where.not(id: table_ids)
  end
end
