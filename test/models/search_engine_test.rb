require "test_helper"

class FakeIndex
  def find(term)
    { "term" => term, "results" => [] }
  end
end

class SearchEngineTest < ActiveSupport::TestCase
  test "search finds result from the index" do
    index = FakeIndex.new

    engine = SearchEngine.new(index)

    assert_equal(
      { "term" => "how do you build a search engine?", "results" => [] },
      engine.search("how do you build a search engine?")
    )
  end
end
