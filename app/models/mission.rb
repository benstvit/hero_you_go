class Mission < ApplicationRecord
  belongs_to :user
  belongs_to :hero
  validates %i[start_date end_date status location content title], presence: true
end
