class Query < ApplicationRecord
  has_many :comments, as: :commentable

  def results
    index = YamlIndex.new
    index.load
    engine = SearchEngine.new(index)

    engine.search(search_term)["results"]
  end
end
