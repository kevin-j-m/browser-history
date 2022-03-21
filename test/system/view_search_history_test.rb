require "application_system_test_case"

class ViewSearchHistoryTest < ApplicationSystemTestCase
  test "shows all searches and comments" do
    question = Query.create!(search_term: "question")
    question.comments.create!(body: "quizzical")
    puzzle = Query.create!(search_term: "puzzle")
    puzzle.comments.create!(body: "puzzling")

    visit queries_path

    assert_text "question"
    assert_text "quizzical"
    assert_text "puzzle"
    assert_text "puzzling"
  end
end
