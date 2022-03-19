class SearchEngine
  def initialize(index)
    @index = index
  end

  def search(term)
    @index.find(term)
  end
end
