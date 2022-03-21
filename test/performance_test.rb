require "test_helper"

class PerformanceTest < ActionDispatch::IntegrationTest
  def populate(scale_factor)
    scale_factor.times do
      question = Query.create!(search_term: "question")
      question.comments.create!(body: "quizzical")
    end
  end

  test "search history does not produce N+1 queries" do
    Bullet.enable = false

    assert_perform_constant_number_of_queries do
      get "/queries"
    end

    Bullet.enable = true
  end
end
