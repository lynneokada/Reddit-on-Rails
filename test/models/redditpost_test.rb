require 'test_helper'

class RedditpostTest < ActiveSupport::TestCase
  def setup
    @user = users(:lynne)
    @redditpost = redditposts(:morgante)
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

  test "should sort redditpost by scoring order" do
    update_all_sorting_scores
    ordered_by_sorting_score = Redditpost.order(sorting_score: :DESC)
    ordered_by_score = Redditpost.order(score: :DESC)
    length = ordered_by_score.count-1
    (0..length).each do |i|
      assert ordered_by_sorting_score[i].title == ordered_by_score[i].title
    end
    # assert_equal(ordered_by_date, ordered_by_sorting_score, "sorting post score failed")
  end
end
