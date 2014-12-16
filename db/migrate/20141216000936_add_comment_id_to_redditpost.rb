class AddCommentIdToRedditpost < ActiveRecord::Migration
  def change
    add_column :redditposts, :comment_id, :integer
  end
end
