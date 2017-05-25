json.array! @beacons do |beacon|
  json.partial! 'api/beacons/beacon', beacon: beacon

  if beacon.last_location
    json.last_location do
      json.partial! 'api/locations/location', location: beacon.last_location
    end
  end
end
