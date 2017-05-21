require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  setup do
    @location = locations(:location)
  end

  test 'valid' do
    assert @location.valid?
  end
end
