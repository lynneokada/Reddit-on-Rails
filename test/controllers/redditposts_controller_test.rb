require 'test_helper'

class RedditpostsControllerTest < ActionController::TestCase

  def setup
    @redditpost = redditposts(:CSyeS)
  end

  test "should redirect create when no logged in" do
    assert_no_difference 'Redditpost.count' do
      post :create, redditpost: { content: "Lorem ipsum" }
    end
    assert_redirect root_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Redditpost.count' do
      delete :destroy, id: @redditpost
    end
    assert_redirected_to login_url
  end
end
