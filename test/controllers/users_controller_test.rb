require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'should create user' do
    @user.destroy

    assert_difference('User.count') do
      post api_user_url, params: { user: @user.attributes.merge(password: 'qwerty123') }, as: :json
    end

    assert_response 201
  end

  test 'should show user' do
    get api_user_url(@user, api_token: api_token), as: :json
    assert_response :success
  end

  test 'should update user' do
    patch api_user_url(@user, api_token: api_token), params: { user: { email: @user.email, name: @user.name } }, as: :json
    assert_response 200
  end
end
