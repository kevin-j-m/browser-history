class Search
  def initialize(query:, search_engine:)
    @query = query
    @search_engine = search_engine
  end

  def execute
    @result = @search_engine
      .search(@query.search_term)

    self
  end

  def term
    return nil unless @result.present?

    @result["term"]
  end

  def results
    return [] unless @result.present?

    @result["results"].map { |r| SearchResult.new(r) }
  end

  def results?
    results.present?
  end
end
