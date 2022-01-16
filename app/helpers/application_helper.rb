module ApplicationHelper
  def full_title(title = "")
    default_title = "通販サイト"
    if title.blank?
      default_title
    else
      "#{title} | #{default_title}"
    end
  end
end
