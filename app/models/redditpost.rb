class Redditpost < ActiveRecord::Base
  # relationships
  belongs_to :user

  # validations
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

end
