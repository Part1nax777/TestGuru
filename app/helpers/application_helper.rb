module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def flash_message(type_flash)
    content_tag :p, flash[type_flash], class: "flash #{type_flash}" if flash[type_flash]
  end
end
