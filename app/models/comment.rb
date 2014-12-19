class Comment < ActiveRecord::Base
  belongs_to :redditpost
  belongs_to :user
  has_many :votes, as: :votable, dependent: :destroy

  validates :redditpost_id, presence: true
  validates :body, presence: true           # actual reddit allows blank comments
  validates :user_id, presence: true
  validates :score, presence: true

  def update_score
    self.score = self.total_votes
    self.save
    # sort_score_for_votable(self)
  end

  def total_votes
    upvotes = self.votes.where(up: true).count
    downvotes = self.votes.where(up: false).count
    return upvotes - downvotes
  end
end
