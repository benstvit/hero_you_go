class Hero < ApplicationRecord
  belongs_to :user
  has_many :hero_powers
  has_many :powers, through: :hero_powers
  has_many :reviews, dependent: :destroy
  has_many :missions
  has_one_attached :photo
  validates :price, :location, presence: true
  validates :name, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_power_name_and_location,
    against: [ :name, :location ],
    associated_against: {
      powers: [ :power ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
