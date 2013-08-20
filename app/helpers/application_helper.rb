# encoding: UTF-8

module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "ИТ-аутсорсинг в Нижнем Новгороде"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


  def is_active(action)       
    params[:action] == action ? "active" : nil        
  end
end