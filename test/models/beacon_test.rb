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

  test 'should not activate if already activated' do
    refute @beacon.activate(@beacon.user, @beacon.code)
  end

  test 'should not activate with invalid code' do
    refute @on_sale_beacon.activate(@on_sale_beacon.user, SecureRandom.hex)
  end

  test 'should activate with valid code' do
    assert @on_sale_beacon.activate(@on_sale_beacon.user, @on_sale_beacon.code)
  end
end
