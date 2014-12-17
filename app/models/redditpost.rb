class Redditpost < ActiveRecord::Base
  # relationships
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  # validations
  VALID_URL_REGEX = /^(http(?:s)?\:\/\/[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}\/(.)*)/

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }, format: {with: VALID_URL_REGEX}

end
