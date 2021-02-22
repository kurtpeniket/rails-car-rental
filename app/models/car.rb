class Car < ApplicationRecord
  belongs_to :user
  # validates :price_per_day, presence: true, numericality: { only_integer: true }
  # validates :brand, presence: true
  # validates :model, presence: true
end
