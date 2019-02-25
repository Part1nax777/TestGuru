module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    "http://github.com/#{author}/#{repo}"
  end

  def flash_class(level)
    flash_alert = { notice: 'alert alert-info',
                    success: 'alert alert-success',
                    error: 'alert alert-danger',
                    alert: 'alert alert-warning' }
    flash_alert[level.to_sym]
  end

end
