class SearchResult
  def initialize(result)
    @result = result
  end

  def rank
    @result["rank"]
  end

  def title
    @result["title"]
  end

  def url
    @result["url"]
  end

  def host
    URI(url).host
  end
end
