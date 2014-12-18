require 'test_helper'

class RedditpostTest < ActiveSupport::TestCase
  def setup
    @user = users(:lynne)
    @redditpost = redditposts(:morgante)
    # @redditpost = @user.redditposts.build(title: "CSYES", content: "https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-xpa1/v/t1.0-9/522085_10103964458375665_7692157870835212098_n.jpg?oh=6263ca0032abe7642b0583255aa3f4cc&oe=554031E8&__gda__=1426146896_6361cc3d3da259d6b644bb03a9dd0371")
  end

  test "reddit post should be valid" do
    assert @redditpost.valid?
  end

  test "user id should be present" do
    @redditpost.user_id = nil
    assert_not @redditpost.valid?
  end

  test "content should be present" do
    @redditpost.content = "      "
    assert_not @redditpost.valid?
  end

  test "should return votable score of redditpost" do
    sorting_score = score_for_votable(@redditpost.score, @redditpost.created_at)
    assert sorting_score > 0
  end
end
