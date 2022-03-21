require "test_helper"

class SearchHistoryTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  test "clear deletes all queries" do
    Query.create!(search_term: "looking for something")

    SearchHistory.clear

    assert_equal 0, Query.count
  end

  test "clear deletes any comments associated with queries as well" do
    query = Query.create!(search_term: "looking for something")
    query.comments.create!(body: "some information")

    perform_enqueued_jobs do
      SearchHistory.clear
    end

    assert_equal 0, Comment.count
    assert_equal 0, ActionText::RichText.count
  end
end
