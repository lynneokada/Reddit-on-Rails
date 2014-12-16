module RedditpostsHelper

  def display_comment_count(count, noun)
    noun.pluralize(count)
  end

  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end

end
