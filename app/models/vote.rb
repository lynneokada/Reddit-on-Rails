#reguire

#module

class Vote < ActiveRecord::Base


  belongs_to :user
  belongs_to :comment
  belongs_to :votable, polymorphic: true

  scope :up, lambda{ where(:vote_flag => true) }
  scope :down, lambda{ where(:vote_flag => false) }

  validates :up, presence: true
  validates :votable_id, presence: true
  validates :votable_type, presence: true
  
  
  
end
