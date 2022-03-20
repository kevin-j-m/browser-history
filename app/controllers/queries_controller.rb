class QueriesController < ApplicationController
  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)

    if @query.save
      redirect_to @query, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    query = Query.find(params[:id])

    index = YamlIndex.new
    index.load
    engine = SearchEngine.new(index)

    @results = engine.search(query.search_term)["results"]
  end

  private

  def query_params
    params.require(:query).permit(:search_term)
  end
end
