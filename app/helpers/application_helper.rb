module ApplicationHelper
  def full_title(title = "")
    default_title = "私立探求学園Rails専攻"
    if title.blank?
      default_title
    else
      "#{title} | #{default_title}"
    end
  end
end
