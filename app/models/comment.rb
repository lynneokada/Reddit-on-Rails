class Comment < ActiveRecord::Base
  belongs_to :redditpost
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy

  validates :redditpost_id, presence: true
  validates :body, presence: true           # actual reddit allows blank comments
  validates :user_id, presence: true
  validates :score, presence: true
end
