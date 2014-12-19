class Redditpost < ActiveRecord::Base
  # relationships
  belongs_to :user
  belongs_to :subreddit
  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  # validations
  VALID_URL_REGEX = /\A(http(?:s)?\:\/\/[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,8}\/(.)*)\z/

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }, format: {with: VALID_URL_REGEX}

  def total_votes
    upvotes = self.votes.where(up: true).count
    downvotes = self.votes.where(up: false).count
    return upvotes - downvotes
  end

end
