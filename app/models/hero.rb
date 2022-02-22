class Hero < ApplicationRecord
  belongs_to :user
  has_many :hero_powers
  has_many :powers, through: :hero_powers
  has_many :reviews, dependent: :destroy
  has_many :missions
  validates :price, :location, presence: true
  validates :name, uniqueness: true
end
