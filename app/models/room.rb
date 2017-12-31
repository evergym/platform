class Room < ApplicationRecord
  belongs_to :user
  
  validates :room_type, presence: true
end
