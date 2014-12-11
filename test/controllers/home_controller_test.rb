require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "title should be reddit's title" do
    get 'home'
    assert_select "title", "reddit: the front page of the internet"
  end
end
