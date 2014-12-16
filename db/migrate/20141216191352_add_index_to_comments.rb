class AddIndexToComments < ActiveRecord::Migration
  def change
    add_index :comments, [:redditpost_id, :score]
  end
end
