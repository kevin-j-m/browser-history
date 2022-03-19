require "test_helper"

class YamlIndexTest < ActiveSupport::TestCase
  test "load has one entry per item in the index" do
    index = YamlIndex.new

    assert_equal 6, index.load.size
  end

  test "load modifies the overall key to be the full search term" do
    index = YamlIndex.new

    assert_equal "fatal error: ‘libpq-fe.h’ file not found", index.load.keys.first
  end

  test "find returns the search results matching the search term" do
    index = YamlIndex.new
    index.load

    result = index.find("fatal error: ‘libpq-fe.h’ file not found")

    assert_equal 3, result["results"].size
  end

  test "find returns no result before the index is loaded" do
    index = YamlIndex.new

    result = index.find("fatal error: ‘libpq-fe.h’ file not found")

    assert_equal({ "term" => "fatal error: ‘libpq-fe.h’ file not found", results: [] }, result)
  end

  test "find returns no result when no matching search term exists" do
    index = YamlIndex.new
    index.load

    result = index.find("no result")

    assert_equal({ "term" => "no result", results: [] }, result)
  end
end
