class Redditpost < ActiveRecord::Base
  # relationships
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  # validations
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }

end
