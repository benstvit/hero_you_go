class Hero < ApplicationRecord
  skip_before_action :authenticate_user!, only: %i[index show]

  belongs_to :user
  has_many :powers, through: :hero_powers
  has_many :hero_powers
  has_many :reviews
  has_many :missions
  validates :price, :location, presence: true
  validates :name, uniqueness: true
end
