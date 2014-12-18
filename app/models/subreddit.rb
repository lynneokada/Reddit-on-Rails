class Subreddit < ActiveRecord::Base
  has_many :redditposts
end
