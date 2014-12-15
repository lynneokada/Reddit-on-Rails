class Comment < ActiveRecord::Base
  belongs_to :redditpost
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy
end
