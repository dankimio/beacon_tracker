class Location < ApplicationRecord
  belongs_to :beacon, touch: true
  belongs_to :user

  validates :latitude, inclusion: { in: -90..90 }
  validates :longitude, inclusion: { in: -180..180 }

  after_create :reverse_geocode

  reverse_geocoded_by :latitude, :longitude do |beacon, results|
    geo = results.first
    next unless geo

    beacon.address = geo.address
    beacon.city = geo.city
    beacon.country = geo.country
    beacon.country_code = geo.country_code
  end
end
