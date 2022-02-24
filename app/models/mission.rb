class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :hero
  validates :start_date, :end_date, :status, :location, :content, :title, presence: true

  # def unavailable_dates
  #   bookings.pluck(:start_date, :end_date).map do |range|
  #     { from: range[0], to: range[1] }
  #   end
  # end
end
