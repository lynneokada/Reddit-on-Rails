require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:lynne)
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "      "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "      "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  # test "email should reject invalid email addresses" do
  #   invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
  #     foo@bar_baz.com foo@bar+baz.com]
  #     invalid_addresses.each do |invalid_address|
  #       @user.email = invalid_address
  #       assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  #     end
  #   end
end
