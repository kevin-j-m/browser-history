class Query < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy_async

  delegate :results?, :results, to: :search_result

  private

  def search_result(search_engine = SearchEngine.new)
    @search_result ||= execute_search(search_engine)
  end

  def execute_search(search_engine)
    search = Search.new(query: self, search_engine: search_engine)
    search.execute
  end
end
