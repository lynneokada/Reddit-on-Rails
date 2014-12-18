class AddSortingScoreToComments < ActiveRecord::Migration
  def change
    add_column :comments, :sorting_score, :float
  end
end
