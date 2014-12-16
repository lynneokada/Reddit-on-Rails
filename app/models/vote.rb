class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :up, presence: true
  validates :user_id, presence: true
  validate :post_xor_comment

  private

    def post_xor_comment
      if !(post_id.blank? ^ comment_id.blank?)
        errors.add(:base, "Vote can be on a comment or post, but not both")
      end
    end

end
