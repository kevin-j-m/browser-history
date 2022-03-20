class SearchEngine

  def initialize(index = YamlIndex.new)
    @index = index
  end

  def search(term)
    @index.set
    @index.find(term)
  end
end
