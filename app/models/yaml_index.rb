class YamlIndex
  def set
    @index ||= YAML
      .load_file(Rails.root.join('index.yml'))
      .each_with_object({}) do |(_k, value), hash|
        hash[value["term"]] = value
      end
  end

  def find(term)
    return no_result(term) unless defined?(@index)

    @index[term] || no_result(term)
  end

  private

  def no_result(term)
    { "term" => term, "results" => [] }
  end
end
