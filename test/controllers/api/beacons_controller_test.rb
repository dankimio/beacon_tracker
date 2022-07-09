require 'test_helper'

class API::BeaconsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @beacon = beacons(:beacon)
    @on_sale_beacon = beacons(:on_sale_beacon)
  end

  test 'should get index' do
    get api_beacons_url(api_token: api_token), as: :json
    assert_response :success
  end

  test 'should show beacon' do
    get api_beacon_url(@beacon.major_minor_string, api_token: api_token), as: :json
    assert_response :success
  end

  test 'should update beacon' do
    patch api_beacon_url(@beacon.major_minor_string, api_token: api_token), params: {
                                                                              beacon: @beacon.attributes
                                                                            }, as: :json
    assert_response 200
  end
end
