class HeroPower < ApplicationRecord
  belongs_to :power_id
  belongs_to :hero_id
end
