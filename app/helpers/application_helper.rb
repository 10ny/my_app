module ApplicationHelper

  #ページごとの完全なタイトル表示のメソッド
  def full_title(page_title = "")
    base_title = "Serve"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

end
