class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :brand, presence: true
  validates :model, presence: true
  # validates :address, presence: true
  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # search
  include PgSearch::Model
  pg_search_scope :search_by_brand_and_model,
    against: [ :brand, :model ],
    using: {
      tsearch: { prefix: true }
    }
end
