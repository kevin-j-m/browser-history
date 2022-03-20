require "test_helper"

class SearchTest < ActiveSupport::TestCase
  test "execute returns itself after conducting the search" do
    query = Query.new(search_term: "example")
    engine = SearchEngine.new(FakeIndex.new)

    search = Search.new(query: query, search_engine: engine)

    assert search.execute.results?
  end

  test "term is nil when the search has not been executed" do
    query = Query.new(search_term: "example")
    engine = SearchEngine.new(FakeIndex.new)

    search = Search.new(query: query, search_engine: engine)

    refute search.term
  end

  test "term is the value searched for" do
    query = Query.new(search_term: "example")
    engine = SearchEngine.new(FakeIndex.new)

    search = Search.new(query: query, search_engine: engine)
    search.execute

    assert_equal "example", search.term
  end

  test "results is empty when the search has not been executed" do
    query = Query.new(search_term: "example")
    engine = SearchEngine.new(FakeIndex.new)

    search = Search.new(query: query, search_engine: engine)

    assert_equal [], search.results
  end

  test "results has the sites found matching the value searched for" do
    query = Query.new(search_term: "example")
    engine = SearchEngine.new(FakeIndex.new)

    search = Search.new(query: query, search_engine: engine)
    search.execute

    assert_equal 1, search.results.size

    result = search.results.first

    assert_equal 1, result.rank
    assert_equal "Some information you searched for", result.title
    assert_equal "https://example.com", result.url
  end

  test "results? is true when there are results" do
    query = Query.new(search_term: "example")
    engine = SearchEngine.new(FakeIndex.new)

    search = Search.new(query: query, search_engine: engine)
    search.execute

    assert search.results?
  end

  test "results? is false when there are no results" do
    query = Query.new(search_term: "nope")
    engine = SearchEngine.new(FakeIndex.new)

    search = Search.new(query: query, search_engine: engine)

    refute search.results?
  end
end
