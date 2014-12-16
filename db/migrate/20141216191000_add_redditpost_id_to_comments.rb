class AddRedditpostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :redditpost_id, :integer
  end
end
