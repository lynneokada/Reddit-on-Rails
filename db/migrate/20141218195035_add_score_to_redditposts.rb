class AddScoreToRedditposts < ActiveRecord::Migration
  def change
    add_column :redditposts, :score, :integer
  end
end
