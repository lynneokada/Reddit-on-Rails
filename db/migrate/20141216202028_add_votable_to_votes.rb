class AddVotableToVotes < ActiveRecord::Migration
  def up
    remove_column :votes, :post_id
    remove_column :votes, :comment_id
    remove_column :votes, :votable_id
    change_table :votes do |t|
      t.references :votable, :polymorphic => true
    end
  end


  def down
    change_table :votes do |t|
      t.remove_references :votable, :polymorphic => true
    end
    add_column :votes, :post_id
    add_column :votes, :comment_id
    add_column :votes, :votable_id
  end
end
