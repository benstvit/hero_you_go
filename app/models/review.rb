class Review < ApplicationRecord
  belongs_to :user_id
  belongs_to :hero_id
end
