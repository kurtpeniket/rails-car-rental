class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :brand, presence: true
  validates :model, presence: true
end
