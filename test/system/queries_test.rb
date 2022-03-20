require "application_system_test_case"

class QueriesTest < ApplicationSystemTestCase
  test "create a query with no results" do
    visit new_query_url

    fill_in "Search Term", with: "making a new search"
    click_on "Create Query"

    assert_text "making a new search"
    assert_text "No results found"
  end

  test "create a query with results" do
    visit new_query_url

    fill_in "Search Term", with: "ruby strftime"
    click_on "Create Query"

    assert_text "ruby strftime"
    assert_text "Class: DateTime (Ruby 3.1.1)"
  end
end
