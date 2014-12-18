class AddNameToSubreddits < ActiveRecord::Migration
  def change
    add_column :subreddits, :name, :string
  end
end
