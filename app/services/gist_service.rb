class GistService
  def initialize(result)
    @result = result
  end

  def success?
    @result.present?
  end
end
