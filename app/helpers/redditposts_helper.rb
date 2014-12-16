module RedditpostsHelper

  def display_comment_count(count, noun)
    noun.pluralize(count)
  end

end
