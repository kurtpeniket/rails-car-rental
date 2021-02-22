class Car < ApplicationRecord
  belongs_to :user
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :type, presence: true
  validates :model, presence: true
end
