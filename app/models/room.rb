class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  
  validates :room_type, presence: true
end
