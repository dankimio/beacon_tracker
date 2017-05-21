class Location < ApplicationRecord
  belongs_to :beacon
  belongs_to :user

  validates :latitude, inclusion: { in: -90..90 }
  validates :longitude, inclusion: { in: -180..180 }
end
