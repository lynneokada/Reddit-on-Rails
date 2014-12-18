class Subreddit < ActiveRecord::Base
  has_many :redditposts
  validates :name, presence: true, length: {maximum: 255}
end
