class Reservation < ActiveRecord::Base
  belongs_to :table

  validates :seats, :date_time, :table_id, presence: true

  enum status: [:reserved, :occupied, :closed]

  scope :active_and_reserved, -> { where('(status = 0 OR status = 1) AND date_time >= ?', Time.now.beginning_of_day)}

  def formatted_date_time
    return nil if date_time.blank?
    date_time.strftime('%Y-%m-%d %H:%M')
  end
end
