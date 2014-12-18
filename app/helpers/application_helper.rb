module ApplicationHelper

  def score_for_votable(votes, object_created_at, gravity = 1.8)
    if !votes
      raise "votes cannot be nil"
    end
    object_age = ((Time.zone.now - object_created_at) / 3600).round
    return (votes - 1) / ((object_age + 2) ** gravity)
  end

  def sort_score_for_votable(votable)
    votable.sorting_score = score_for_votable(votable.score, votable.created_at)
  end

  def update_all_sorting_scores
    Redditpost.all.each do |redditpost|
      sort_score_for_votable(redditpost)
    end
    Comment.all.each do |comment|
      sort_score_for_votable(comment)
    end
  end
end
