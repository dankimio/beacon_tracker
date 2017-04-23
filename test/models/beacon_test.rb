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

  test 'invalid with invalid code' do
    @on_sale_beacon.entered_code = SecureRandom.hex
    assert @on_sale_beacon.invalid?
  end

  test 'valid with matching code' do
    @on_sale_beacon.entered_code = @on_sale_beacon.code
    @on_sale_beacon.user = @beacon.user
    assert @on_sale_beacon.valid?
  end
end
