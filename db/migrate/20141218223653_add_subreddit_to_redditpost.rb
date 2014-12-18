class AddSubredditToRedditpost < ActiveRecord::Migration
  def change
    add_column :redditposts, :subreddit_id, :integer
  end
end
