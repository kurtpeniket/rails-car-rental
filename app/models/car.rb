class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :type, presence: true
  validates :model, presence: true
end
