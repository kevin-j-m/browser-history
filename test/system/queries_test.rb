require "application_system_test_case"

class QueriesTest < ApplicationSystemTestCase
  test "create a new query" do
    visit new_query_url

    fill_in "Search Term", with: "making a new search"
    click_on "Create Query"

    assert_text "making a new search"
    assert_text "No results found"
  end
end
