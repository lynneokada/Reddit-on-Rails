module ApplicationHelper

  def score_for_votable(votes, object_created_at, gravity = 1.8)
    object_age = ((Time.zone.now - object_created_at) / 3600).round
    return (votes - 1) / ((object_age + 2) ** gravity)
  end
end
