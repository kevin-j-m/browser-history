require "test_helper"

class SearchEngineTest < ActiveSupport::TestCase
  test "search finds result from the index" do
    index = FakeIndex.new

    engine = SearchEngine.new(index)

    assert_equal(
      { "term" => "how do you build a search engine?", "results" => [] },
      engine.search("how do you build a search engine?")
    )
  end

  test "search sets the index and finds result against it" do
    index = FakeIndex.new

    engine = SearchEngine.new(index)

    assert_equal(
      [
        {
          "rank" => 1,
          "title" => "An example",
          "url" => "https://example.com",
        }
      ],
      engine.search("example")["results"]
    )
  end
end
