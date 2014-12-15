class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :up
      t.integer :user_id
      t.integer :post_id
      t.integer :comment_id

      t.timestamps null: false
    end
    add_index :votes, [:user_id, :comment_id, :post_id]
  end
end
