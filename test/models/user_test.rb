require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:foo)
  end

  test 'valid' do
    assert @user.valid?
  end

  test 'email uniqueness' do
    new_user = @user.dup
    new_user.email.upcase!

    assert new_user.invalid?
  end
end
