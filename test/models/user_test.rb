require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Lynne Okada", email: "lynne@makeschool.com", password: "rubyruby", password_confirmation: "rubyruby")
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

end
