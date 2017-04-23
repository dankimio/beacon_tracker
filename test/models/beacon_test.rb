require 'test_helper'

class BeaconTest < ActiveSupport::TestCase
  setup do
    @beacon = beacons(:beacon)
    @on_sale_beacon = beacons(:on_sale_beacon)
  end

  test 'valid' do
    assert @beacon.valid?
  end

  test 'major and minor value uniqueness' do
    new_beacon = @beacon.dup
    assert new_beacon.invalid?
  end
end
