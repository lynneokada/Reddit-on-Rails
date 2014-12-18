class AddSortingScoreToRedditposts < ActiveRecord::Migration
  def change
    add_column :redditposts, :sorting_score, :float
  end
end
