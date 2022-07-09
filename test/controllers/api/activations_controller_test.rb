require 'test_helper'

class API::ActivationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @on_sale_beacon = beacons(:on_sale_beacon)
  end

  test 'should activate beacon' do
    post api_beacon_activations_url(@on_sale_beacon.major_minor_string, api_token: api_token), params: {
                                                                                                 beacon: @on_sale_beacon.attributes
                                                                                               }, as: :json
    assert_response 201
    assert @on_sale_beacon.reload.disabled?
  end
end
