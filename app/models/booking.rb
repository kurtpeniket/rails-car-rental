class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user
  validates :start_date, presence: true
  validates :total_days, numericality: { only_integer: true }
  # validates :total_price, presence: true, numericality: { only_integer: true }
end
