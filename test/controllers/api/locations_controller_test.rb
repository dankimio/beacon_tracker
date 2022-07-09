require 'test_helper'

class API::LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:location)
    @beacon = @location.beacon
  end

  test 'should get index' do
    get api_beacon_locations_url(@beacon.major_minor, api_token: api_token), as: :json
    assert_response :success
  end

  test 'should create location' do
    assert_difference 'Location.count' do
      post api_beacon_locations_url(@beacon.major_minor, api_token: api_token), params: {
                                                                                  location: @location.attributes
                                                                                }, as: :json
    end

    assert_response 201
  end
end
