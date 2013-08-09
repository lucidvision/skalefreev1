module ApplicationHelper

	def full_title(page_title)
    base_title = "SkaleFree"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def notice
    flash[:notice]
  end

  def alert
    flash[:alert]
  end
end