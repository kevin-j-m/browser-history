class FakeIndex
  def set
    {
      "example" => {
        "term" => "example",
        "results" => [
          "rank" => 1,
          "title" => "Some information you searched for",
          "url" => "https://example.com",
        ]
      }
    }
  end

  def find(term)
    set[term] || { "term" => term, "results" => [] }
  end
end
