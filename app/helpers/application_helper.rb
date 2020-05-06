module ApplicationHelper
  def full_title page_title = ""
    base_title = t "static_page.home.text1"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
