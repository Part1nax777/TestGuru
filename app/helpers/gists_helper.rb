module GistsHelper

  def gist_id(url)
    url.split('/').last
  end
end
