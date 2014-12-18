class Vote < ActiveRecord::Base

	#attr_accessible :votable_id, :votable_type, :user_id

  belongs_to :user
  belongs_to :comment
  belongs_to :votable, polymorphic: true

  scope :up, lambda{ where(:vote_flag => true) }
  scope :down, lambda{ where(:vote_flag => false) }

  validates :up, presence: true
  validates :votable_id, presence: true
  validates :votable_type, presence: true

  validates :user_id, uniqueness: {scope: [:votable_type, :votable_id]}
end
