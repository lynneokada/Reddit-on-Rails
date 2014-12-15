class CreateRedditposts < ActiveRecord::Migration
  def change
    create_table :redditposts do |t|
      t.string :title
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :redditposts, [:user_id, :created_at]
  end
end
